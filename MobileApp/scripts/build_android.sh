#!/usr/bin/env bash
set -euo pipefail

# PUBLIC_INTERFACE
# shellcheck disable=SC2016
: <<'DOC'
This script builds the Android APK for the Flutter app in Docker/CI environments.
- Runs flutter pub get
- Cleans Gradle
- Builds a debug APK using Flutter's tooling (which configures the embedding v2 pipeline)
Usage:
  ./scripts/build_android.sh
DOC

# Ensure flutter SDK is discoverable; prefer local.properties fallback for Gradle as well
if ! command -v flutter >/dev/null 2>&1; then
  echo "ERROR: flutter CLI not found on PATH. Ensure the Docker image provides Flutter SDK."
  exit 127
fi

# Fetch dependencies
flutter pub get

# Optional: clean Android build
pushd android >/dev/null
./gradlew --no-daemon clean
popd >/dev/null

# Build debug APK (this invokes the new Gradle plugin via Flutter)
flutter build apk --debug -v
echo "Build completed: $(ls -1 build/app/outputs/flutter-apk/*.apk 2>/dev/null || echo 'APK path may vary by Flutter version')"
