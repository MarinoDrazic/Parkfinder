import 'package:flutter/material.dart';
import 'package:parkfinder/services/router.gr.dart';
import 'package:parkfinder/views/sign_up/sign_up_viewmodel.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<SignUpViewmodel>.value(
        value: SignUpViewmodel(),
        child: Consumer<SignUpViewmodel>(builder: (context, model, child) {
          if (!model.listenerSetUp) {
            model.setUpListener();
          }
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(flex: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/logomain.png",
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ],
                    ),
                    Spacer(flex: 1),
                    Text(
                      "Get Started",
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Let's create your account!",
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey.withOpacity(0.1)),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(
                                Icons.person,
                                color: Colors.indigo,
                                size: 32,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: model.name,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Jotaro Kujo'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(
                                model.firstTime
                                    ? Icons.info
                                    : model.validName
                                        ? Icons.check_circle_outline
                                        : Icons.cancel,
                                color: model.firstTime
                                    ? Colors.indigo
                                    : model.validName
                                        ? Colors.greenAccent
                                        : Colors.redAccent,
                                size: 32,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey.withOpacity(0.1)),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(
                                Icons.alternate_email,
                                color: Colors.indigo,
                                size: 32,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: model.email,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'somebody@somewhere.ro'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(
                                model.firstTime
                                    ? Icons.info
                                    : model.validEmail
                                        ? Icons.check_circle_outline
                                        : Icons.cancel,
                                color: model.firstTime
                                    ? Colors.indigo
                                    : model.validEmail
                                        ? Colors.greenAccent
                                        : Colors.redAccent,
                                size: 32,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey.withOpacity(0.1)),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(
                                Icons.lock,
                                color: Colors.indigo,
                                size: 32,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                obscureText: true,
                                controller: model.password,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '*********'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(
                                model.firstTime
                                    ? Icons.info
                                    : model.validPassword
                                        ? Icons.check_circle_outline
                                        : Icons.cancel,
                                color: model.firstTime
                                    ? Colors.indigo
                                    : model.validPassword
                                        ? Colors.greenAccent
                                        : Colors.redAccent,
                                size: 32,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        model.showSignUpFailed
                            ? Text(
                                "Invalid login details",
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.red),
                              )
                            : Container(),
                      ],
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height * 0.07,
                          minWidth: MediaQuery.of(context).size.width * 0.7,
                          onPressed: () {
                            model.register(context);
                          },
                          color: Colors.indigo,
                          elevation: 6,
                          textColor: Colors.white,
                          child: Text("Get Started",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an account? ",
                          style: TextStyle(fontSize: 16.0, color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: () {
                            Router.navigator.pushNamed(Router.login);
                          },
                          child: Text(
                            "Log in",
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.blueAccent),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
