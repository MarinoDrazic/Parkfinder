import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:parkfinder/services/router.gr.dart';
import 'package:parkfinder/views/add_payment_info/add_payment_info.dart';
import 'package:parkfinder/views/booking_details/booking_details_check.dart';
import 'package:parkfinder/views/booking_details/booking_details_total.dart';
import 'package:provider/provider.dart';

import 'booking_details_viewmodel.dart';

class BookingDetails extends StatelessWidget {
  const BookingDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<BookingDetailsViewModel>.value(
        value: BookingDetailsViewModel(),
        child:
            Consumer<BookingDetailsViewModel>(builder: (context, model, child) {
          return SingleChildScrollView(
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
                        "Booking Details",
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
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "Parking ID",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.grey),
                          ),
                          Text(
                            "#23531",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          )
                        ],
                      ),
                      Spacer(flex: 1),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: "23531"));
                          Fluttertoast.showToast(
                              msg: "Copied to clipboard",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              fontSize: 16.0);
                        },
                        child: Icon(
                          Icons.content_copy,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Select parking time",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) => Card(
                      color: Colors.transparent,
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      child: GestureDetector(
                        onTap: () {
                          model.setSelectedTime(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: model.selectedTime == index
                                  ? Colors.indigo
                                  : Colors.indigo.withOpacity(0.3)),
                          child: SizedBox(
                            width: 150,
                            child: Center(
                              child: Text(
                                model.bookingTimes[index],
                                style: TextStyle(
                                  color: model.selectedTime == index
                                      ? Colors.white
                                      : Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "*Selected parking time starts as soon as purchase is complete (" +
                        (DateFormat('MM.dd HH:mm').format(DateTime.now()))
                            .toString() +
                        ").",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 20),
                      child: Text(
                        "Split Parking Mall",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.black38,
                      ),
                    ),
                    Text("Livanjska ulica 16",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38)),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
                BookingDetailsCheck(),
                BookingDetailsTotal(
                  model: model,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: MaterialButton(
                      height: MediaQuery.of(context).size.height * 0.07,
                      minWidth: MediaQuery.of(context).size.width * 0.7,
                      onPressed: () {
                        Router.navigator.pushNamed(Router.addPaymentInfo);
                      },
                      color: Colors.indigo,
                      elevation: 6,
                      textColor: Colors.white,
                      child: Text("Book Now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )),
                      padding: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
