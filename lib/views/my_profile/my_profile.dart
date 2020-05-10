import 'package:flutter/material.dart';
import 'package:parkfinder/services/firebase_auth.dart';
import 'package:parkfinder/views/my_profile/my_profile_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:parkfinder/services/router.gr.dart';

class Myprofile extends StatefulWidget {
  Myprofile({Key key}) : super(key: key);

  @override
  _MyprofileState createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  @override
  void initState() {
    checkIfLoggedIn();
    super.initState();
  }

  void checkIfLoggedIn() async {
    new Future.delayed(Duration.zero, () {
      FirebaseAuthenticationService firebaseAuthenticationService =
          Provider.of<FirebaseAuthenticationService>(context, listen: false);
      if (!firebaseAuthenticationService.isUserLoggedIn()) {
        Router.navigator.pushReplacementNamed(Router.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<MyProfileViewModel>.value(
        value: MyProfileViewModel(),
        child: Consumer<MyProfileViewModel>(builder: (context, model, child) {
          return SingleChildScrollView(
            child: Container(
              color: Colors.red,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          );
        }),
      ),
    );
  }
}
