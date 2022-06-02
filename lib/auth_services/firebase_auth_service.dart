import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> currentUser() async {
    try {
      User? user = _firebaseAuth.currentUser;
      return user;
    } catch (e) {
      print("Firebase Auth Service current user hata" + e.toString());
      return null;
    }
  }

  Future<UserCredential?> createUserWithEmail(
      String email, String password) async {
    try {
      UserCredential sonuc = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return sonuc;
    } catch (e) {
      print("Firebase Auth Service create user hata" + e.toString());
      return null;
    }
  }

  Future<void> sendPasswordResetEmail(
    String email,
  ) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print("Firebase reset password hata" + e.toString());
    }
  }

  Future<UserCredential?> signInWithEmail(String email, String password) async {
    try {
      UserCredential sonuc = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return sonuc;
    } catch (e) {
      print("Firebase Auth Service sign in hata" + e.toString());
      return null;
    }
  }

  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();

      return true;
    } catch (e) {
      print("Firebase Auth Service sign out hata" + e.toString());
      return false;
    }
  }
}
