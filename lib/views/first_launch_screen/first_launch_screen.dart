import 'package:flutter/material.dart';
import 'package:parkfinder/services/router.gr.dart';
import 'package:parkfinder/views/main_feed/main_feed.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FirstLaunchScreen extends StatefulWidget {
  FirstLaunchScreen({Key key}) : super(key: key);

  @override
  _FirstLaunchScreenState createState() => _FirstLaunchScreenState();
}

class _FirstLaunchScreenState extends State<FirstLaunchScreen> {
  final controller = PageController(viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        PageView(
          controller: controller,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Spacer(
                    flex: 1,
                  ),
                  Image.asset("assets/firstlaunch_first.PNG"),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      "Welcome To Parkfinder",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                        "Find the best possible parking space nearby your desired destination.",
                        style: TextStyle(fontSize: 18, color: Colors.black38),
                        textAlign: TextAlign.center),
                  ),
                  Spacer(flex: 1),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: GestureDetector(
                          onTap: () {
                            Router.navigator.pushNamed(Router.mainFeed);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black38),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Spacer(
                    flex: 10,
                  ),
                  Image.asset(
                    "assets/firstlaunch_second.PNG",
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      "We are currently only available in Split",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                        "We are working as hard as we can to expand our parking system to as many cities as possible.",
                        style: TextStyle(fontSize: 18, color: Colors.black38),
                        textAlign: TextAlign.center),
                  ),
                  Spacer(flex: 12),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Spacer(
                        flex: 10,
                      ),
                      Image.asset("assets/firstlaunch_third.PNG"),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text(
                          "Only credit card payments",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                            "We currently only support credit card payments. Some time in the future we plan to expand to cash payments in parking booths.",
                            style:
                                TextStyle(fontSize: 18, color: Colors.black38),
                            textAlign: TextAlign.center),
                      ),
                      Spacer(flex: 12),
                    ],
                  ),
                  Positioned(
                    bottom: 50,
                    right: 30,
                    child: MaterialButton(
                      onPressed: () {
                        Router.navigator.pushNamed(Router.mainFeed);
                      },
                      color: Colors.indigo,
                      textColor: Colors.white,
                      child: Text("Got it"),
                      padding: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: ExpandingDotsEffect(),
          ),
        ),
      ],
    ));
  }
}
