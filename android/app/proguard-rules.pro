# ML Kit Text Recognition Proguard rules to ignore missing optional languages classes
-dontwarn com.google.mlkit.vision.text.**

# Google Mobile Ads Proguard rules
-keep class com.google.android.gms.ads.** { *; }
-dontwarn com.google.android.gms.ads.**

# SQLCipher / Sqflite rules
-keep class net.sqlcipher.** { *; }
-keep class net.sqlcipher.database.** { *; }
