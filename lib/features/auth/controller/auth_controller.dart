import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  FirebaseAuth get _auth => FirebaseAuth.instance;

  // Stream of user auth state changes
  Stream<User?> get authStateChanges {
    try {
      return _auth.authStateChanges();
    } catch (_) {
      return const Stream.empty();
    }
  }

  // Currently logged in user
  User? get currentUser {
    try {
      return _auth.currentUser;
    } catch (_) {
      return null;
    }
  }

  // Sign in with Google (Gmail)
  Future<UserCredential> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        final GoogleAuthProvider googleProvider = GoogleAuthProvider();
        googleProvider.addScope('email');
        return await _auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignIn googleSignIn = GoogleSignIn();
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
        if (googleUser == null) {
          throw 'Google sign-in was cancelled';
        }
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        return await _auth.signInWithCredential(credential);
      }
    } catch (e) {
      if (e.toString().contains('cancelled')) {
        throw 'Sign-in was cancelled';
      }
      throw _handleAuthException(e);
    }
  }

  // Sign in with email and password
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
    } catch (e) {
      throw _handleAuthException(e);
    }
  }

  // Register with email, password, and display name
  Future<UserCredential> signUp({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      if (name != null && name.trim().isNotEmpty) {
        await credential.user?.updateDisplayName(name.trim());
      }

      return credential;
    } catch (e) {
      throw _handleAuthException(e);
    }
  }

  // Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } catch (e) {
      throw _handleAuthException(e);
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Convert Firebase error codes into clean user-friendly messages
  String _handleAuthException(dynamic e) {
    String code = '';
    String? message;
    if (e is FirebaseAuthException) {
      code = e.code;
      message = e.message;
    } else if (e is FirebaseException) {
      code = e.code;
      message = e.message;
    }
    final rawString = e.toString();

    if (code == 'popup-closed-by-user' ||
        rawString.contains('popup-closed-by-user')) {
      return 'Sign-in popup was closed before completing.';
    }
    if (code == 'account-exists-with-different-credential' ||
        rawString.contains('account-exists-with-different-credential')) {
      return 'An account already exists with this email using a different sign-in method.';
    }
    if (code == 'user-not-found' || rawString.contains('user-not-found')) {
      return 'No account found with this email. Please register first.';
    }
    if (code == 'wrong-password' ||
        rawString.contains('wrong-password') ||
        code == 'invalid-credential' ||
        rawString.contains('invalid-credential') ||
        rawString.contains('INVALID_LOGIN_CREDENTIALS')) {
      return 'Incorrect email or password. Please try again or register if you do not have an account.';
    }
    if (code == 'email-already-in-use' ||
        rawString.contains('email-already-in-use')) {
      return 'An account already exists with this email. Please log in.';
    }
    if (code == 'invalid-email' || rawString.contains('invalid-email')) {
      return 'The email address is not valid.';
    }
    if (code == 'weak-password' || rawString.contains('weak-password')) {
      return 'Password is too weak. Please use at least 6 characters.';
    }
    if (code == 'operation-not-allowed' ||
        rawString.contains('operation-not-allowed')) {
      return 'Email/Password sign-in is disabled in Firebase Console. Please enable it in Authentication -> Sign-in method.';
    }
    if (code == 'user-disabled' || rawString.contains('user-disabled')) {
      return 'This account has been disabled.';
    }
    if (code == 'too-many-requests' ||
        rawString.contains('too-many-requests')) {
      return 'Too many attempts. Please try again later.';
    }
    if (code == 'network-request-failed' ||
        rawString.contains('network-request-failed')) {
      return 'Network error. Please check your internet connection.';
    }
    if (rawString.contains('no-app') || rawString.contains('FirebaseApp')) {
      return 'Firebase is not initialized. Please refresh the browser (Ctrl+Shift+R).';
    }
    return message ?? (rawString.isNotEmpty ? rawString : 'Authentication failed. Please try again.');
  }
}
