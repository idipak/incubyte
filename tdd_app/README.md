# String Calculator TDD App

A Flutter application implementing a String Calculator using **TDD (Test-Driven Development)**, **Clean Architecture**, and **BLoC** for state management.

## Features

*   **String Calculator Logic**:
    *   Adds numbers from a comma-separated string.
    *   Supports newlines as delimiters (e.g., `1\n2,3`).
    *   Supports custom delimiters (e.g., `//;\n1;2`).
    *   Throws exceptions for negative numbers, listing all occurrences.
    *   Ignores numbers greater than 1000.
*   **Real-time Calculation**: Deboubed input handling for smooth user experience.
*   **Clean Architecture**: Separation of concerns with Domain, and Presentation layers.
*   **State Management**: `flutter_bloc` with `rxdart` for event transformation.

## Project Structure

```
lib/
├── features/
│   └── string_calculator/
│       ├── domain/
│       │   └── string_calculator.dart  # Core Logic
│       └── presentation/
│           ├── bloc/                   # BLoC, Events, States
│           └── pages/                  # UI Page
└── main.dart                           # App Entry Point
```

## Getting Started

1.  **Get Dependencies**:
    ```bash
    flutter pub get
    ```

2.  **Run Tests**:
    This project was built using TDD. Run the comprehensive test suite:
    ```bash
    flutter test
    ```

3.  **Run App**:
    ```bash
    flutter run
    ```
