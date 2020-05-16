import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
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
                    "Help",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                "I have no idea what to put here",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
