# Note App 📝

A modern, responsive, and secure note-taking application built with **Flutter** and powered by **Firebase**.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)

---

## 🌟 Features

- **🔐 Authentication**:
  - Secure Email & Password sign-in and registration with live validation.
  - One-tap Google / Gmail sign-in with popup (Web) and native auth (Mobile).
  - Password reset email recovery flow.
  - Reactive `AuthProvider` state management.
- **📱 Clean & Responsive UI**:
  - Warm golden amber theme (`#FFB800`).
  - Responsive layouts across Web browsers and mobile screen sizes.
  - Custom branded snackbars with instant feedback.
- **🗂️ Home Workspace**:
  - Clean greeting header with user display name.
  - Category selector chips (All Notes, Work, Personal, Ideas).
  - Grid View and List View switcher.
  - Interactive note editor with pin, edit, and delete functionality.
  - Safe sign-out confirmation dialog.

---

## 📂 Project Architecture

```
note_app/
├── android/                       # Android native project & Gradle config
├── ios/                           # iOS native project & Info.plist
├── linux/                         # Linux desktop runner
├── macos/                         # macOS desktop runner
├── web/                           # Web assets & index.html configuration
├── windows/                       # Windows desktop runner
├── lib/
│   ├── common/
│   │   ├── common_colors.dart     # Brand theme & palette definitions
│   │   └── custom_snackbar.dart   # Centralized SnackBar notification system
│   ├── features/
│   │   ├── auth/
│   │   │   ├── controller/
│   │   │   │   ├── auth_controller.dart  # Firebase Auth business logic
│   │   │   │   └── auth_provider.dart    # AuthProvider ChangeNotifier
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
└── pubspec.yaml                   # Dependencies & package metadata
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.0.0 or higher)
- [Dart SDK](https://dart.dev/get-dart)

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

3. **Run the Application**:
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

# Run widget tests
flutter test
```
