import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:parkfinder/models/user.dart';
import 'package:parkfinder/services/firestore_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class FirebaseAuthenticationService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _currentUser;

  bool isUserLoggedIn() {
    return _currentUser != null;
  }

  FirebaseUser getUser() => _currentUser;

  Future<bool> signIn(String email, String password) async {
    try {
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      if (user != null) {
        _currentUser = user;
        _saveUserDetails(email, password);
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> registerUser(
    String email,
    String password,
    String fullName,
    String role,
    BuildContext context,
  ) async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
    if (user != null) {
      _currentUser = user;
      _saveUserDetails(email, password);

      Provider.of<FirestoreService>(context, listen: false).createUser(
          User(id: user.uid, email: email, fullName: fullName, userRole: role));
      return true;
    }
    return false;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  void _saveUserDetails(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("lastEmail", email);
    // save password as plaintext 😂 pls no steal hackerman
    // if this was anything important id use flutter_secure_storage to save login token insted of password
    await prefs.setString('lastPassword', password);
  }

  Future<bool> logInWithSavedCred() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = (prefs.getString("lastEmail") ?? "");
    String lastPassword = (prefs.getString("lastPassword") ?? "");

    return await signIn(email, lastPassword);
  }
}
