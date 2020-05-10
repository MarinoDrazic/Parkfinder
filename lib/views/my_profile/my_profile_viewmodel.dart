import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:parkfinder/services/firebase_auth.dart';
import 'package:provider/provider.dart';

class MyProfileViewModel extends ChangeNotifier {
  BuildContext context;
  FirebaseUser user;
  void updateContext(BuildContext context) {
    context = context;
  }

  Future<void> getUser() async {
    FirebaseAuthenticationService firebaseAuthenticationService =
        Provider.of<FirebaseAuthenticationService>(context);
    if (firebaseAuthenticationService.isUserLoggedIn()) {
      user = firebaseAuthenticationService.getUser();
    } else if (await firebaseAuthenticationService.logInWithSavedCred()) {
      user = firebaseAuthenticationService.getUser();
    }
    notifyListeners();
  }
}
