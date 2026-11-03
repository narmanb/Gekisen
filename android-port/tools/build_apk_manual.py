#!/usr/bin/env python3
"""Build Gekisen.apk without the Android SDK / Gradle.

This is a fallback for machines that can't reach Google's servers. It needs:
  * a JDK (javac, java)
  * android-all.jar      (org.robolectric:android-all, from Maven Central) as android.jar
  * dalvik-dx.jar        (com.jakewharton.android.repackaged:dalvik-dx) to make classes.dex
  * apksig.jar           (com.android.tools.build:apksig) to sign (APK signature scheme v2,
                         so the APK needs Android 7.0+)

It writes the binary AndroidManifest.xml and resources.arsc itself, so aapt2 is not needed.

usage: build_apk_manual.py --libs DIR --out Gekisen.apk [--version-code N]
"""
import argparse
import os
import shutil
import struct
import subprocess
import sys
import tempfile
import zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
PORT = os.path.dirname(HERE)
APP = os.path.join(PORT, 'android', 'app', 'src', 'main')
WEB = os.path.join(PORT, 'web')

# android.R.attr / android.R.style ids (from the framework jar)
ATTR = {
    'theme': 0x01010000, 'label': 0x01010001, 'icon': 0x01010002, 'name': 0x01010003,
    'exported': 0x01010010, 'launchMode': 0x0101001d, 'screenOrientation': 0x0101001e,
    'configChanges': 0x0101001f, 'versionCode': 0x0101021b, 'versionName': 0x0101021c,
    'minSdkVersion': 0x0101020c, 'targetSdkVersion': 0x01010270, 'allowBackup': 0x01010280,
    'hardwareAccelerated': 0x010102d3,
}
THEME_MATERIAL_NOACTIONBAR_FULLSCREEN = 0x0103022f
ANDROID_NS = 'http://schemas.android.com/apk/res/android'

T_REF, T_STRING, T_INT_DEC, T_INT_HEX, T_BOOL = 0x01, 0x03, 0x10, 0x11, 0x12


# ----------------------------------------------------------------- string pool
def string_pool(strings):
    """UTF-16 ResStringPool chunk."""
    offsets = []
    data = b''
    for s in strings:
        offsets.append(len(data))
        enc = s.encode('utf-16-le')
        n = len(s)
        if n > 0x7fff:
            raise ValueError('string too long')
        data += struct.pack('<H', n) + enc + b'\0\0'
    while len(data) % 4:
        data += b'\0'
    header_size = 28
    strings_start = header_size + 4 * len(strings)
    size = strings_start + len(data)
    hdr = struct.pack('<HHIIIIII', 0x0001, header_size, size, len(strings), 0, 0, strings_start, 0)
    return hdr + b''.join(struct.pack('<I', o) for o in offsets) + data


# ------------------------------------------------------------------ binary XML
class AXML:
    def __init__(self):
        self.attr_names = []      # strings that map to resource ids (must come first)
        self.strings = []
        self.events = []

    def s(self, v):
        if v is None:
            return 0xffffffff
        if v in self.attr_names:
            return self.attr_names.index(v)
        if v not in self.strings:
            self.strings.append(v)
        return None  # resolved later

    def start(self, tag, attrs):
        self.events.append(('start', tag, attrs))

    def end(self, tag):
        self.events.append(('end', tag))

    def build(self):
        # collect strings: attribute names with resource ids first
        for ev in self.events:
            if ev[0] == 'start':
                for (ns, name, typ, val) in ev[2]:
                    if ns == ANDROID_NS and name not in self.attr_names:
                        self.attr_names.append(name)
        others = ['android', ANDROID_NS]
        for ev in self.events:
            others.append(ev[1])
            if ev[0] == 'start':
                for (ns, name, typ, val) in ev[2]:
                    if ns != ANDROID_NS:
                        others.append(name)
                    if typ == T_STRING:
                        others.append(val)
        pool = list(self.attr_names)
        for o in others:
            if o not in pool:
                pool.append(o)
        idx = {v: i for i, v in enumerate(pool)}

        chunks = [string_pool(pool)]
        resmap = b''.join(struct.pack('<I', ATTR[n]) for n in self.attr_names)
        chunks.append(struct.pack('<HHI', 0x0180, 8, 8 + len(resmap)) + resmap)

        def node(typ, body, line=1):
            return struct.pack('<HHIII', typ, 16, 16 + len(body), line, 0xffffffff) + body

        ns_body = struct.pack('<II', idx['android'], idx[ANDROID_NS])
        chunks.append(node(0x0100, ns_body))
        for ev in self.events:
            if ev[0] == 'start':
                attrs = sorted(ev[2], key=lambda a: (ATTR.get(a[1], 0x7fffffff) if a[0] == ANDROID_NS else 0x7fffffff, a[1]))
                ab = b''
                for (ns, name, typ, val) in attrs:
                    nsi = idx[ANDROID_NS] if ns == ANDROID_NS else 0xffffffff
                    if typ == T_STRING:
                        raw, data = idx[val], idx[val]
                    else:
                        raw = 0xffffffff
                        data = val & 0xffffffff
                    ab += struct.pack('<IIIHBBI', nsi, idx[name], raw, 8, 0, typ, data)
                body = struct.pack('<IIHHHHHH', 0xffffffff, idx[ev[1]], 20, 20, len(attrs), 0, 0, 0) + ab
                chunks.append(node(0x0102, body))
            else:
                chunks.append(node(0x0103, struct.pack('<II', 0xffffffff, idx[ev[1]])))
        chunks.append(node(0x0101, ns_body))
        body = b''.join(chunks)
        return struct.pack('<HHI', 0x0003, 8, 8 + len(body)) + body


def manifest(version_code, version_name, target_sdk=35, min_sdk=24):
    A = ANDROID_NS
    x = AXML()
    x.start('manifest', [
        (A, 'versionCode', T_INT_DEC, version_code),
        (A, 'versionName', T_STRING, version_name),
        (None, 'package', T_STRING, 'com.gekisen.game'),
    ])
    x.start('uses-sdk', [(A, 'minSdkVersion', T_INT_DEC, min_sdk), (A, 'targetSdkVersion', T_INT_DEC, target_sdk)])
    x.end('uses-sdk')
    x.start('application', [
        (A, 'theme', T_REF, THEME_MATERIAL_NOACTIONBAR_FULLSCREEN),
        (A, 'label', T_REF, 0x7f020000),
        (A, 'icon', T_REF, 0x7f010000),
        (A, 'allowBackup', T_BOOL, 0xffffffff),
        (A, 'hardwareAccelerated', T_BOOL, 0xffffffff),
    ])
    x.start('activity', [
        (A, 'name', T_STRING, 'com.gekisen.game.MainActivity'),
        (A, 'exported', T_BOOL, 0xffffffff),
        (A, 'launchMode', T_INT_DEC, 2),            # singleTask
        (A, 'screenOrientation', T_INT_DEC, 6),     # sensorLandscape
        (A, 'configChanges', T_INT_HEX, 0x0ff0),
    ])
    x.start('intent-filter', [])
    x.start('action', [(A, 'name', T_STRING, 'android.intent.action.MAIN')])
    x.end('action')
    x.start('category', [(A, 'name', T_STRING, 'android.intent.category.LAUNCHER')])
    x.end('category')
    x.end('intent-filter')
    x.end('activity')
    x.end('application')
    x.end('manifest')
    return x.build()


# -------------------------------------------------------------- resources.arsc
def arsc(app_name, icon_path):
    gpool = string_pool([icon_path, app_name])
    types = ['mipmap', 'string']
    keys = ['ic_launcher', 'app_name']
    tpool = string_pool(types)
    kpool = string_pool(keys)

    def type_chunks(type_id, key_idx, value_type, value_data):
        spec = struct.pack('<HHIBBHI', 0x0202, 16, 16 + 4, type_id, 0, 0, 1) + struct.pack('<I', 0)
        config = struct.pack('<I', 64) + b'\0' * 60
        header_size = 20 + len(config)
        entries_start = header_size + 4
        entry = struct.pack('<HHI', 8, 0, key_idx) + struct.pack('<HBBI', 8, 0, value_type, value_data)
        size = entries_start + len(entry)
        typ = struct.pack('<HHIBBHII', 0x0201, header_size, size, type_id, 0, 0, 1, entries_start) + config
        typ += struct.pack('<I', 0) + entry
        return spec + typ

    body = tpool + kpool + type_chunks(1, 0, T_STRING, 0) + type_chunks(2, 1, T_STRING, 1)
    name = 'com.gekisen.game'.encode('utf-16-le').ljust(256, b'\0')
    pkg_header_size = 288
    pkg = struct.pack('<HHI', 0x0200, pkg_header_size, pkg_header_size + len(body))
    pkg += struct.pack('<I', 0x7f) + name
    pkg += struct.pack('<IIIII', pkg_header_size, len(types), pkg_header_size + len(tpool), len(keys), 0)
    pkg += body
    total = 12 + len(gpool) + len(pkg)
    return struct.pack('<HHII', 0x0002, 12, total, 1) + gpool + pkg


# ------------------------------------------------------------------- zip/apk
def write_aligned_zip(path, entries):
    """entries: list of (name, bytes, compress). Stored entries are 4-byte aligned."""
    with zipfile.ZipFile(path, 'w') as z:
        for name, data, compress in entries:
            zi = zipfile.ZipInfo(name, date_time=(2008, 1, 1, 0, 0, 0))
            zi.create_system = 0
            if compress:
                zi.compress_type = zipfile.ZIP_DEFLATED
            else:
                zi.compress_type = zipfile.ZIP_STORED
                # local header = 30 + len(name) + len(extra); pad extra so data is aligned
                offset = z.fp.tell() + 30 + len(name.encode())
                pad = (4 - offset % 4) % 4
                zi.extra = b'\0' * pad
            z.writestr(zi, data)


SIGNER_JAVA = r'''
import com.android.apksig.ApkSigner;
import java.io.*;
import java.security.*;
import java.security.cert.X509Certificate;
import java.util.*;

public class Sign {
    public static void main(String[] a) throws Exception {
        KeyStore ks = KeyStore.getInstance("JKS");
        try { ks.load(new FileInputStream(a[2]), a[3].toCharArray()); }
        catch (IOException e) { ks = KeyStore.getInstance("PKCS12"); ks.load(new FileInputStream(a[2]), a[3].toCharArray()); }
        PrivateKey key = (PrivateKey) ks.getKey(a[4], a[5].toCharArray());
        X509Certificate cert = (X509Certificate) ks.getCertificate(a[4]);
        ApkSigner.SignerConfig sc = new ApkSigner.SignerConfig.Builder("GEKISEN", key,
            Collections.singletonList(cert)).build();
        new ApkSigner.Builder(Collections.singletonList(sc))
            .setInputApk(new File(a[0])).setOutputApk(new File(a[1]))
            .setMinSdkVersion(24).setV1SigningEnabled(false).setV2SigningEnabled(true)
            .build().sign();
    }
}
'''


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--libs', required=True, help='dir with android-all.jar, dalvik-dx*.jar, apksig.jar')
    ap.add_argument('--out', required=True)
    ap.add_argument('--version-code', type=int, default=1)
    ap.add_argument('--keystore', default=os.path.join(PORT, 'android', 'gekisen-release.keystore'))
    ap.add_argument('--storepass', default='gekisen')
    ap.add_argument('--alias', default='gekisen')
    ap.add_argument('--keypass', default='gekisen')
    a = ap.parse_args()
    libs = os.path.abspath(a.libs)
    android_jar = os.path.join(libs, 'android-all.jar')
    dx_jar = [os.path.join(libs, f) for f in os.listdir(libs) if f.startswith('dalvik-dx')][0]
    apksig = os.path.join(libs, 'apksig.jar')

    tmp = tempfile.mkdtemp(prefix='gekisen-apk-')
    try:
        # 1. compile + dex
        classes = os.path.join(tmp, 'classes')
        os.makedirs(classes)
        srcs = []
        for dp, _, fn in os.walk(os.path.join(APP, 'java')):
            srcs += [os.path.join(dp, f) for f in fn if f.endswith('.java')]
        # android-all has no java.* classes (Robolectric uses the host JDK), so compile
        # against the JDK 8 API with the framework jar on the classpath
        subprocess.check_call(['javac', '-nowarn', '--release', '8', '-encoding', 'UTF-8',
                               '-cp', android_jar, '-d', classes] + srcs)
        dex = os.path.join(tmp, 'classes.dex')
        subprocess.check_call(['java', '-cp', dx_jar, 'com.android.dx.command.Main', '--dex',
                               '--min-sdk-version=24', '--output=' + dex, classes])

        # 2. manifest + resources
        icon = os.path.join(APP, 'res', 'mipmap-xxxhdpi', 'ic_launcher.png')
        entries = [
            ('AndroidManifest.xml', manifest(a.version_code, '1.0.%d' % a.version_code), True),
            ('classes.dex', open(dex, 'rb').read(), True),
            ('resources.arsc', arsc('Gekisen', 'res/mipmap/ic_launcher.png'), False),
            ('res/mipmap/ic_launcher.png', open(icon, 'rb').read(), False),
        ]
        for dp, _, fn in os.walk(WEB):
            for f in sorted(fn):
                full = os.path.join(dp, f)
                rel = os.path.relpath(full, WEB).replace(os.sep, '/')
                comp = not f.endswith(('.png', '.ogg'))
                entries.append(('assets/' + rel, open(full, 'rb').read(), comp))
        unsigned = os.path.join(tmp, 'unsigned.apk')
        write_aligned_zip(unsigned, entries)

        # 3. sign (v2; apksig 2.x's v1 signer doesn't work on modern JDKs)
        sdir = os.path.join(tmp, 'signer')
        os.makedirs(sdir)
        open(os.path.join(sdir, 'Sign.java'), 'w').write(SIGNER_JAVA)
        subprocess.check_call(['javac', '-nowarn', '-cp', apksig, '-d', sdir, os.path.join(sdir, 'Sign.java')])
        # apksig 2.x uses sun.security.* internals that newer JDKs hide
        opens = []
        for pkg in ('sun.security.x509', 'sun.security.pkcs', 'sun.security.util'):
            opens += ['--add-exports', 'java.base/%s=ALL-UNNAMED' % pkg, '--add-opens', 'java.base/%s=ALL-UNNAMED' % pkg]
        subprocess.check_call(['java'] + opens + ['-cp', apksig + os.pathsep + sdir, 'Sign', unsigned, os.path.abspath(a.out),
                               a.keystore, a.storepass, a.alias, a.keypass])
        print('wrote', a.out, os.path.getsize(a.out), 'bytes')
    finally:
        shutil.rmtree(tmp, ignore_errors=True)


if __name__ == '__main__':
    sys.exit(main())
