import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static const String _userKey = 'user_logged_in';

  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _setLoginState(true);
      return result.user;
    } catch (e) {
      // Remove print in production
      rethrow;
    }
  }

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _setLoginState(true);
      return result.user;
    } catch (e) {
      // Remove print in production
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _setLoginState(false);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_userKey) ?? false;
  }

  Future<void> _setLoginState(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_userKey, isLoggedIn);
  }

  User? get currentUser => _auth.currentUser;
}