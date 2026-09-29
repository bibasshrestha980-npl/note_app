# Contributing to Note App

Thank you for your interest in contributing to **Note App**! We welcome contributions of all kinds, from bug fixes and documentation improvements to new features and architectural enhancements.

---

## Code of Conduct

Please be respectful and considerate of other contributors. We strive to maintain a welcoming, inclusive, and collaborative environment.

---

## How Can I Contribute?

### 1. Reporting Bugs
- Search existing issues to ensure the bug hasn't already been reported.
- Open a new issue with a clear title and description.
- Include steps to reproduce, expected vs. actual behavior, and relevant device/OS/Flutter version details.

### 2. Suggesting Features
- Open an issue describing the feature, the problem it solves, and how you imagine it working.
- Discuss ideas with the community before starting major implementations.

### 3. Submitting Pull Requests
1. **Fork the repository** on GitHub.
2. **Clone your fork**:
   ```bash
   git clone https://github.com/<your-username>/note_app.git
   cd note_app
   ```
3. **Create a branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```
4. **Make your changes**:
   - Write clean, readable, and idiomatic Dart code.
   - Follow Flutter best practices and design patterns.
   - Maintain documentation and add comments where necessary.
5. **Run tests & static analysis**:
   ```bash
   flutter analyze
   flutter test
   ```
   Ensure both commands pass with 0 errors.
6. **Commit your changes**:
   Use meaningful commit messages following the Conventional Commits style:
   - `feat: add note search functionality`
   - `fix: resolve auth exception handling on web`
   - `docs: update setup instructions in README`
7. **Push to GitHub**:
   ```bash
   git push origin feature/your-feature-name
   ```
8. **Open a Pull Request**:
   Provide a clear summary of changes and reference any related issues.

---

## Project Structure

```
lib/
├── common/             # Reusable UI widgets, snackbars, and colors
├── features/
│   ├── auth/           # Authentication (views, controller, forms)
│   └── home/           # Main notes workspace & dashboard
├── firebase_options.dart # Generated Firebase configuration
└── main.dart           # App entry point
```

---

## Development Setup

1. Install [Flutter SDK](https://docs.flutter.dev/get-started/install).
2. Clone this repository and run:
   ```bash
   flutter pub get
   ```
3. Connect your Firebase project:
   ```bash
   flutterfire configure
   ```
4. Launch the app:
   ```bash
   flutter run -d chrome    # Or an Android emulator / device
   ```

Thank you for contributing!
