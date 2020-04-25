import 'package:flutter/material.dart';
import 'package:parkfinder/views/first_launch_screen/first_launch_screen.dart';
import 'package:parkfinder/views/main_feed/main_feed.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key key}) : super(key: key);
  GlobalKey _scaffold = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      _firstLaunchChecker(context, _scaffold);
    });

    return Scaffold(
      key: _scaffold,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.indigo])),
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/logosmall.png",
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              Text(
                "Parkfinder",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            ],
          ))
        ],
      ),
    );
  }
}

_firstLaunchChecker(BuildContext context, GlobalKey _scaffold) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool firstLaunch = (prefs.getBool('firstLaunch') ?? true);
  await prefs.setBool('firstLaunch', false);

  Navigator.of(_scaffold.currentContext).pushReplacement(
    MaterialPageRoute(
        builder: (context) => firstLaunch ? FirstLaunchScreen() : MainFeed()),
  );
}
