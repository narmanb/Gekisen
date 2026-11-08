#!/usr/bin/env python3
"""Set android:minSdkVersion in an APK's binary AndroidManifest.xml (in place on a copy).

Godot's prebuilt template declares minSdk 21, which requires a v1 (JAR) signature.
Raising it to 24 lets an APK signature scheme v2 signature stand on its own.

usage: patch_min_sdk.py in.apk out.apk [min_sdk=24]
"""
import struct
import sys
import zipfile

MIN_SDK_ATTR = 0x0101020c


def patch_axml(data, value):
    data = bytearray(data)
    p = 8
    resmap = []
    found = False
    while p < len(data):
        typ, hsz, size = struct.unpack_from('<HHI', data, p)
        if typ == 0x0180:                        # resource map
            n = (size - hsz) // 4
            resmap = list(struct.unpack_from('<%dI' % n, data, p + hsz))
        elif typ == 0x0102:                      # start element
            ext = p + 16
            attr_start, attr_size, count = struct.unpack_from('<HHH', data, ext + 8)
            a = ext + attr_start
            for i in range(count):
                q = a + i * attr_size
                name = struct.unpack_from('<I', data, q + 4)[0]
                dtype = data[q + 15]
                if name < len(resmap) and resmap[name] == MIN_SDK_ATTR and dtype in (0x10, 0x11):
                    struct.pack_into('<I', data, q + 16, value)
                    found = True
        p += size
    if not found:
        raise SystemExit('minSdkVersion attribute not found')
    return bytes(data)


def main():
    src, dst = sys.argv[1], sys.argv[2]
    value = int(sys.argv[3]) if len(sys.argv) > 3 else 24
    zin = zipfile.ZipFile(src)
    with zipfile.ZipFile(dst, 'w') as zout:
        for info in zin.infolist():
            data = zin.read(info.filename)
            if info.filename == 'AndroidManifest.xml':
                data = patch_axml(data, value)
            if info.filename.startswith('META-INF/') and info.filename.upper().endswith(('.SF', '.RSA', '.EC', '.DSA', 'MANIFEST.MF')):
                continue
            zi = zipfile.ZipInfo(info.filename, date_time=info.date_time)
            zi.compress_type = info.compress_type
            zi.external_attr = info.external_attr
            if info.compress_type == zipfile.ZIP_STORED:
                # keep stored data aligned (4 bytes, 4096 for native libraries)
                align = 4096 if info.filename.endswith('.so') else 4
                offset = zout.fp.tell() + 30 + len(info.filename.encode())
                zi.extra = b'\0' * ((align - offset % align) % align)
            zout.writestr(zi, data)
    print('minSdkVersion ->', value)


if __name__ == '__main__':
    main()
