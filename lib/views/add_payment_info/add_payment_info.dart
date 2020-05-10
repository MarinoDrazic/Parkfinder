import 'package:flutter/material.dart';
import 'package:parkfinder/services/router.gr.dart';
import 'package:parkfinder/views/add_payment_info/add_payment_info_viewmodel.dart';
import 'package:parkfinder/views/parking_codes/parking_codes.dart';
import 'package:provider/provider.dart';

class AddPaymentInfo extends StatelessWidget {
  const AddPaymentInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<AddPaymentInfoViewModel>.value(
        value: AddPaymentInfoViewModel(),
        child:
            Consumer<AddPaymentInfoViewModel>(builder: (context, model, child) {
          model.initSquarePayment();
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        "Add Payment Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                ),
                Image.asset("assets/firstlaunch_third.PNG"),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, top: 24, bottom: 8),
                  child: Text("Add Credit Card",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Text("Please add your credit card information",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: InkWell(
                      child: MaterialButton(
                        height: MediaQuery.of(context).size.height * 0.07,
                        minWidth: MediaQuery.of(context).size.width * 0.7,
                        onPressed: () {
                          Router.navigator.pushNamed(Router.parkingCodes);
                        },
                        color: Colors.indigo,
                        elevation: 6,
                        textColor: Colors.white,
                        child: Text(model.nonce != null ? "Continue" : "Skip",
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
                ),
              ],
            ),
          );
        }),
      ),
    ));
  }
}
