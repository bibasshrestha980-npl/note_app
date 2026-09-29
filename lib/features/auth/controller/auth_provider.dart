import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'auth_controller.dart';

class AuthProvider extends ChangeNotifier {
  final AuthController _controller = AuthController();
  User? _user;
  bool _isLoading = false;

  AuthProvider() {
    _init();
  }

  User? get user => _user;
  bool get isAuthenticated => _user != null;
  bool get isLoading => _isLoading;

  void _init() {
    _user = _controller.currentUser;
    _controller.authStateChanges.listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      final credential = await _controller.signIn(
        email: email,
        password: password,
      );
      return credential;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<UserCredential> signUp({
    required String email,
    required String password,
    String? name,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      final credential = await _controller.signUp(
        email: email,
        password: password,
        name: name,
      );
      return credential;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    _isLoading = true;
    notifyListeners();
    try {
      final credential = await _controller.signInWithGoogle();
      return credential;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _controller.sendPasswordResetEmail(email);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    _isLoading = true;
    notifyListeners();
    try {
      await _controller.signOut();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
