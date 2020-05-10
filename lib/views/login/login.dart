import 'package:flutter/material.dart';
import 'package:parkfinder/views/login/login_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:parkfinder/services/router.gr.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<LoginViewModel>.value(
        value: LoginViewModel(),
        child: Consumer<LoginViewModel>(builder: (context, model, child) {
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
                      "Welcome Back!",
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Enter your information to continue",
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
                                    : model.emailValid
                                        ? Icons.check_circle_outline
                                        : Icons.cancel,
                                color: model.firstTime
                                    ? Colors.indigo
                                    : model.emailValid
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
                                    hintText: '**********'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(
                                model.firstTime
                                    ? Icons.info
                                    : model.passwordValid
                                        ? Icons.check_circle_outline
                                        : Icons.cancel,
                                color: model.firstTime
                                    ? Colors.indigo
                                    : model.passwordValid
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
                        model.showInvalidLoginMsg
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
                            model.login(context);
                          },
                          color: Colors.indigo,
                          elevation: 6,
                          textColor: Colors.white,
                          child: Text("Login",
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
                          "New User? ",
                          style: TextStyle(fontSize: 16.0, color: Colors.grey),
                        ),
                        Text(
                          "Get Started",
                          style: TextStyle(
                              fontSize: 16.0, color: Colors.blueAccent),
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
