#!/bin/sh
# Sign a Godot-exported (unsigned) APK with APK signature scheme v2 (Android 7.0+).
#   sign_apk.sh <unsigned.apk> <signed.apk> <path/to/apksig.jar> [keystore] [password] [alias]
# The manifest's minSdkVersion is raised to 24 first (Godot's template says 21, which would
# also need a v1 JAR signature). Signing uses apksig (com.android.tools.build:apksig from
# Maven Central), so the Android SDK isn't needed. The default keystore is the bundled hobby key.
set -e
IN="$1"
OUT="$2"
APKSIG="$3"
HERE="$(cd "$(dirname "$0")" && pwd)"
KS="${4:-$HERE/savages-release.keystore}"
PASS="${5:-savages}"
ALIAS="${6:-savages}"
TMP="$(mktemp -d)"
trap 'rm -rf -- "$TMP"' EXIT

python3 "$HERE/patch_min_sdk.py" "$IN" "$TMP/v1.apk" 24

cat > "$TMP/SignV2.java" <<'EOF'
import com.android.apksig.ApkSigner;
import com.android.apksig.ApkVerifier;
import java.io.*;
import java.security.*;
import java.security.cert.X509Certificate;
import java.util.*;

public class SignV2 {
    public static void main(String[] a) throws Exception {
        KeyStore ks;
        try { ks = KeyStore.getInstance("PKCS12"); ks.load(new FileInputStream(a[2]), a[3].toCharArray()); }
        catch (Exception e) { ks = KeyStore.getInstance("JKS"); ks.load(new FileInputStream(a[2]), a[3].toCharArray()); }
        PrivateKey key = (PrivateKey) ks.getKey(a[4], a[3].toCharArray());
        X509Certificate cert = (X509Certificate) ks.getCertificate(a[4]);
        ApkSigner.SignerConfig sc = new ApkSigner.SignerConfig.Builder("CERT", key,
            Collections.singletonList(cert)).build();
        new ApkSigner.Builder(Collections.singletonList(sc))
            .setInputApk(new File(a[0])).setOutputApk(new File(a[1]))
            .setV1SigningEnabled(false).setV2SigningEnabled(true).build().sign();
        ApkVerifier.Result r = new ApkVerifier.Builder(new File(a[1])).build().verify();
        System.out.println("verified=" + r.isVerified() + " v1=" + r.isVerifiedUsingV1Scheme() + " v2=" + r.isVerifiedUsingV2Scheme());
        for (ApkVerifier.IssueWithParams e : r.getErrors()) System.out.println("ERROR " + e);
        if (!r.isVerified()) System.exit(1);
    }
}
EOF
javac -nowarn -cp "$APKSIG" -d "$TMP" "$TMP/SignV2.java" 2>/dev/null
X="--add-exports java.base/sun.security.pkcs=ALL-UNNAMED --add-exports java.base/sun.security.x509=ALL-UNNAMED --add-exports java.base/sun.security.util=ALL-UNNAMED"
java $X -cp "$APKSIG:$TMP" SignV2 "$TMP/v1.apk" "$OUT" "$KS" "$PASS" "$ALIAS"
