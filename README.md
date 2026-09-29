# Note App 📝

A modern, responsive, and secure note-taking application built with **Flutter** and powered by **Firebase**.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

---

## 🌟 Features

- **🔐 Multiple Sign-In Options**:
  - Secure Email & Password authentication.
  - One-tap Google / Gmail sign-in with popup (Web) and native authentication (Mobile).
  - Forgot password / reset email recovery flow.
- **📱 Clean & Responsive UI**:
  - Warm golden amber theme (`#FFB800`).
  - Fluid adaptiveness across Web browsers and mobile screen sizes.
  - Custom branded snackbars with instant feedback for success, warnings, and errors.
- **🗂️ Home Workspace**:
  - Clean greeting header with user avatar.
  - Category selector chips (All, Work, Personal, Ideas).
  - Illustrated empty state prompt for note creation.
  - Floating Action Button to quickly capture new notes.
  - Safe sign-out confirmation dialog.
- **⚡ Automated CI/CD**:
  - Continuous Integration via GitHub Actions checking format, static analysis, and automated tests on every push.

---

## 📂 Project Architecture

```
note_app/
├── .github/
│   └── workflows/
│       └── flutter_ci.yml         # GitHub Actions CI workflow
├── android/                       # Android native project & Gradle config
├── ios/                           # iOS native project
├── web/                           # Web assets & index.html configuration
├── lib/
│   ├── common/
│   │   ├── common_colors.dart     # Brand theme & palette definitions
│   │   ├── custom_snackbar.dart   # Centralized SnackBar notification system
│   │   └── snackbar.dart          # Legacy snackbar bridge
│   ├── features/
│   │   ├── auth/
│   │   │   ├── controller/
│   │   │   │   └── auth_controller.dart  # Firebase Auth business logic & error mapping
│   │   │   └── view/
│   │   │       ├── login_view.dart       # Sign-in screen
│   │   │       ├── register_view.dart    # User registration screen
│   │   │       └── forgot_password_view.dart # Password reset screen
│   │   └── home/
│   │       └── view/
│   │           └── home_view.dart        # Home dashboard & notes view
│   ├── firebase_options.dart      # Platform-specific Firebase credentials
│   └── main.dart                  # Application entry point
├── test/
│   └── widget_test.dart           # Automated widget tests
├── CONTRIBUTING.md                # Contribution guidelines
└── pubspec.yaml                   # Dependencies & package metadata
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.0.0 or higher)
- [Dart SDK](https://dart.dev/get-dart)
- [Firebase CLI](https://firebase.google.com/docs/cli) (optional, for configuring custom Firebase projects)

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/bibasshrestha980-npl/note_app.git
   cd note_app
   ```

2. **Install Flutter packages**:
   ```bash
   flutter pub get
   ```

3. **Configure Firebase** (if setting up your own project):
   ```bash
   flutterfire configure --project=<your-firebase-project-id>
   ```

4. **Run the Application**:
   - For **Chrome / Web**:
     ```bash
     flutter run -d chrome
     ```
   - For **Android**:
     ```bash
     flutter run -d android
     ```

---

## 🧪 Testing & Code Quality

Run tests and static analysis with:

```bash
# Verify code formatting
dart format --output=none --set-exit-if-changed .

# Run static code analysis
flutter analyze

# Run unit and widget tests
flutter test
```

---

## 🤝 Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
