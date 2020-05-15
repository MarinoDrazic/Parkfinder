import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:parkfinder/services/firebase_auth.dart';
import 'package:parkfinder/services/router.gr.dart';
import 'package:provider/provider.dart';

class SignUpViewmodel extends ChangeNotifier {
  bool firstTime = true;
  bool validName = false;
  bool validEmail = false;
  bool validPassword = false;
  bool showSignUpFailed = false;
  bool listenerSetUp = false;

  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();

  void setUpListener() {
    listenerSetUp = true;
    email.addListener(() {
      showSignUpFailed = false;
      firstTime = false;
      validEmail = EmailValidator.validate(email.text);
      notifyListeners();
    });
    password.addListener(() {
      showSignUpFailed = false;
      firstTime = false;
      if (password.text.length > 6) {
        validPassword = true;
      } else {
        validPassword = false;
      }
      notifyListeners();
    });
    name.addListener(() {
      showSignUpFailed = false;
      firstTime = false;
      if (name.text.length > 6) {
        validName = true;
      } else {
        validName = false;
      }
      notifyListeners();
    });
  }

  Future<void> register(BuildContext context) async {
    FirebaseAuthenticationService firebaseAuthenticationService =
        Provider.of<FirebaseAuthenticationService>(context, listen: false);
    showSignUpFailed = !await firebaseAuthenticationService.registerUser(
        email.text, password.text, name.text, "User", context);
    if (!showSignUpFailed) {
      firebaseAuthenticationService.logInWithSavedCred();
      Router.navigator.pushReplacementNamed(Router.myprofile);
    }
    notifyListeners();
  }
}
