import 'package:flutter/material.dart';
import 'package:parkfinder/views/payment_pass/payment_pass_viewmodel.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class PaymentPass extends StatelessWidget {
  const PaymentPass({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<PaymentPassViewmodel>.value(
        value: PaymentPassViewmodel(),
        child: Consumer<PaymentPassViewmodel>(builder: (context, model, child) {
          model.initSquarePayment();
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
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
                        "Payment Passes",
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
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff09203f), Color(0xff537895)]),
                        borderRadius: BorderRadius.circular(16)),
                    child: buildCreditCard("7588 3465 3446 3568", "Jotaro Kujo",
                        "assets/visa.png"),
                  ),
                ),
                Container(
                  height: 300,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 50,
                        right: 50,
                        top: 100,
                        child: Transform(
                          //magic numbers
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateX(pi / 180 * -60)
                            ..scale(1.0),
                          alignment: Alignment.topCenter,
                          child: Opacity(
                            opacity: 0.8,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xffffecd2),
                                    Color(0xfffcb69f)
                                  ]),
                                  borderRadius: BorderRadius.circular(16)),
                              child: buildCreditCard("5145 3477 5748 3864",
                                  "Jotaro Kujo", "assets/mastercard.png"),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        right: 50,
                        top: 50,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateX(pi / 180 * -60)
                            ..scale(1.0),
                          alignment: Alignment.topCenter,
                          child: Opacity(
                            opacity: 0.8,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xff434343),
                                    Color(0xff000000)
                                  ]),
                                  borderRadius: BorderRadius.circular(16)),
                              child: buildCreditCard("5145 4676 8336 2362",
                                  "Jotaro Kujo", "assets/visa.png"),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        right: 50,
                        top: 10,
                        child: Transform(
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateX(pi / 180 * -60)
                              ..scale(1.0),
                            alignment: Alignment.topCenter,
                            child: Opacity(
                              opacity: 0.8,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    gradient: LinearGradient(colors: [
                                      Color(0xff667eea),
                                      Color(0xff764ba2)
                                    ]),
                                    borderRadius: BorderRadius.circular(16)),
                                child: buildCreditCard("7588 3465 3446 3568",
                                    "Jotaro Kujo", "assets/mastercard.png"),
                              ),
                            )),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white.withOpacity(0.0),
                                  Colors.white
                                ]),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  "Try out our payment gateway supported by Square",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Row(
                    children: <Widget>[
                      Spacer(
                        flex: 1,
                      ),
                      GestureDetector(
                        onTap: () {
                          model.startCardEntryFlow();
                        },
                        child: InkWell(
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.width * 0.5,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Padding(
                                padding: const EdgeInsets.all(24),
                                child: Image.asset("assets/square.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                        "Hint: This is sandbox payment\nCard Number:4111 1111 1111 1111	\nCCV:111",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.grey)),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Column buildCreditCard(
      String cardNumbers, String cardHolder, String cardImage) {
    return Column(
      children: <Widget>[
        Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    cardNumbers,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    cardHolder,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Spacer(flex: 1),
              Image.asset(
                cardImage,
                height: 50,
                width: 100,
              )
            ],
          ),
        )
      ],
    );
  }
}
