# tdd_app

## Project Overview

This is a standard Flutter application, initialized with the default "Counter App" template. It serves as a starting point for building cross-platform mobile (Android, iOS), web, and desktop applications using the Flutter framework and Dart language.

**Main Technologies:**
*   **Framework:** Flutter
*   **Language:** Dart (SDK ^3.9.2)
*   **Platform:** Cross-platform (Android, iOS, Web, MacOS, Linux, Windows)

## Building and Running

### Prerequisites
Ensure you have the Flutter SDK installed and configured on your machine.
Run `flutter doctor` to verify your installation.

### Run Development Server
To run the app on a connected device or emulator:
```bash
flutter run
```

### Testing
To run the unit and widget tests:
```bash
flutter test
```

### Building for Production
*   **Android:** `flutter build apk` or `flutter build appbundle`
*   **iOS:** `flutter build ios` (Requires macOS and Xcode)
*   **Web:** `flutter build web`

## Development Conventions

*   **Coding Style:** Adheres to standard Dart style guidelines.
*   **Linting:** Uses `flutter_lints` (v5.0.0) as configured in `analysis_options.yaml`.
*   **State Management:** Currently uses the default `setState` for local state management (as seen in `lib/main.dart`).
*   **Entry Point:** `lib/main.dart` contains the main application entry point and the root `MyApp` widget.

## Directory Structure

*   `lib/`: Contains the Dart source code for the application.
    *   `main.dart`: The entry point of the application.
*   `test/`: Contains unit and widget tests.
    *   `widget_test.dart`: Default widget test for the counter app.
*   `android/`: Android-specific configuration and build files.
*   `ios/`: iOS-specific configuration and build files.
*   `web/`: Web-specific configuration and entry point.
*   `macos/`, `linux/`, `windows/`: Desktop-specific configuration files.
*   `pubspec.yaml`: Manages dependencies and project metadata.
*   `analysis_options.yaml`: Configures the Dart analyzer and linter rules.
