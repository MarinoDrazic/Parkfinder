import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:parkfinder/services/firebase_auth.dart';
import 'package:parkfinder/services/router.gr.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends ChangeNotifier {
  final email = TextEditingController();
  final password = TextEditingController();
  // i rly should swith to BLoC
  bool listenerSetUp = false;
  bool firstTime = true;
  bool showInvalidLoginMsg = false;
  bool emailValid = false;
  bool passwordValid = false;
  void setUpListener() {
    listenerSetUp = true;
    email.addListener(() {
      showInvalidLoginMsg = false;
      firstTime = false;
      emailValid = EmailValidator.validate(email.text);
      notifyListeners();
    });
    password.addListener(() {
      showInvalidLoginMsg = false;
      firstTime = false;
      if (password.text.length > 6) {
        passwordValid = true;
      } else {
        passwordValid = false;
      }
      notifyListeners();
    });
  }

  Future<void> login(BuildContext context) async {
    FirebaseAuthenticationService firebaseAuthenticationService =
        Provider.of<FirebaseAuthenticationService>(context, listen: false);
    showInvalidLoginMsg =
        !await firebaseAuthenticationService.signIn(email.text, password.text);
    if (!showInvalidLoginMsg) {
      Router.navigator.pushReplacementNamed(Router.myprofile);
    }
    notifyListeners();
  }
}
