import 'dart:math';

import 'package:baklavasina/auth_services/firebase_auth_service.dart';
import 'package:baklavasina/models/auth_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthRepository extends GetxController {
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  AuthUser _user = AuthUser(userEmail: null, userID: null);

  AuthUser get user => _user;
  AuthRepository() {
    currentUser();
  }

  AuthUser _userFromFirebase(User? user) {
    if (user == null) {
      return AuthUser(userID: null, userEmail: null);
    } else {
      return AuthUser(userID: user.uid, userEmail: user.email);
    }
  }

  Future<AuthUser> currentUser() async {
    try {
      User? sonuc = await _firebaseAuthService.currentUser();
      _user = _userFromFirebase(sonuc);
      update();
      return _user;
    } catch (e) {
      print("Auth Repository current user hata" + e.toString());
      _user = AuthUser(userEmail: null, userID: null);
      update();
      return AuthUser(userID: null, userEmail: null);
    }
  }

  Future<AuthUser> createUserWithEmail(String email, String password) async {
    try {
      UserCredential? sonuc =
          await _firebaseAuthService.createUserWithEmail(email, password);

      _user = _userFromFirebase(sonuc!.user);
      update();
      return _user;
    } catch (e) {
      print("Auth Repository create user hata" + e.toString());
      _user = AuthUser(userEmail: null, userID: null);
      update();
      return AuthUser(userID: null, userEmail: null);
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuthService.sendPasswordResetEmail(email);
    } catch (e) {
      print("AuthRepository reset password hata" + e.toString());
    }
  }

  Future<AuthUser> signInWithEmail(String email, String password) async {
    try {
      UserCredential? sonuc =
          await _firebaseAuthService.signInWithEmail(email, password);
      if (sonuc != null) {
        _user = _userFromFirebase(sonuc.user);
        update();
        return _user;
      } else {
        update();
        return AuthUser(userEmail: null, userID: null);
      }
    } catch (e) {
      print("Auth Rpository sign in hata " + e.toString());

      update();

      return AuthUser(userID: null, userEmail: null);
    }
  }

  Future<bool> signOut() async {
    try {
      await _firebaseAuthService.signOut();
      _user = AuthUser(userEmail: null, userID: null);
      update();
      return true;
    } catch (e) {
      print("Auth Repository sign out hata " + e.toString());
      update();
      return false;
    }
  }
}
