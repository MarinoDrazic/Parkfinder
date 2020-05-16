import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        Text(
                          "My profile",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Spacer(
                          flex: 3,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
                    child: Stack(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage("assets/profile.png"),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                Fluttertoast.showToast(
                                    msg: "TODO",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    fontSize: 16.0);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.circular(32)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 32,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Divider(),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Icon(
                          Icons.person_outline,
                          size: 32,
                          color: Colors.indigo,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "NAME",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              "Jotaro Kujo",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Icon(
                          Icons.person_outline,
                          size: 32,
                          color: Colors.indigo,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "EMAIL",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              "mail@mail.hr",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                      Spacer(flex: 1),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.check,
                          size: 32,
                          color: Colors.greenAccent,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Icon(
                          Icons.alternate_email,
                          size: 32,
                          color: Colors.indigo,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "PHONE NUMBER",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: <Widget>[
                              Flag('HR',
                                  height: 20, width: 30, fit: BoxFit.fill),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, top: 4.0),
                                child: Text(
                                  "+091 547 5831",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.check,
                          size: 32,
                          color: Colors.greenAccent,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Icon(
                          Icons.person_outline,
                          size: 32,
                          color: Colors.indigo,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "PASSWORD",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              "*********",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height * 0.07,
                          minWidth: MediaQuery.of(context).size.width * 0.7,
                          onPressed: () {
                            Fluttertoast.showToast(
                                msg: "TODO",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                fontSize: 16.0);
                          },
                          color: Colors.grey,
                          elevation: 6,
                          textColor: Colors.white,
                          child: Text("Update Profile",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                          padding: EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
