# Android V2 Embedding Status

This Android module is configured for Flutter V2 embedding.

- MainActivity extends `io.flutter.embedding.android.FlutterActivity`
- No custom `FlutterApplication` is declared; the manifest uses `${applicationName}`
- No `io/flutter/plugins/GeneratedPluginRegistrant.*` file is present. Plugins auto-register via Flutter tooling.

Build toolchain versions:
- Android Gradle Plugin (AGP): 8.5.2 (see settings.gradle)
- Gradle wrapper: 8.7 (see gradle/wrapper/gradle-wrapper.properties)
- Kotlin: 1.9.24 (see settings.gradle and app build.gradle `org.jetbrains.kotlin.android` plugin)

Build commands:
- From MobileApp root:
  - flutter pub get
  - cd android && ./gradlew --no-daemon clean assembleDebug

If ./gradlew is missing in CI image, invoke via Flutter:
  - flutter build apk --debug

Notes:
- If any plugin requires minSdkVersion > 21, bump it in `android/app/build.gradle`.
- Ensure environment variable or local.properties has `flutter.sdk` defined for Gradle sync.
