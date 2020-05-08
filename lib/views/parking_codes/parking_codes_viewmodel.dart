import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parkfinder/views/parking_codes/parking_codes_cell.dart';

// with or extends?
class ParkingCodesViewModel with ChangeNotifier {
  // i moved this here since this bitch empty anyways
  Widget buildInnerBottomWidget(
      BuildContext context, GlobalKey<SimpleFoldingCellState> key) {
    return Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.indigo.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(flex: 3),
                  Image.asset(
                    "assets/barcode.png",
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  Spacer(flex: 5),
                  GestureDetector(
                    onTap: () {
                      key?.currentState?.toggleFold();
                    },
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      size: 40,
                    ),
                  )
                ]),
          ),
        ));
  }

  Widget buildInnerTopWidget() {
    return Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Container(
          width: double.infinity,
          color: Colors.indigo.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Name: Jojo",
                      style: TextStyle(color: Colors.indigo, fontSize: 25),
                    ),
                    Text(
                      "Phone: +880 193 1344 431",
                      style: TextStyle(color: Colors.indigo),
                    ),
                    Text(
                      "Parking code: #43121",
                      style: TextStyle(color: Colors.indigo),
                    ),
                    Spacer(flex: 1),
                    Text(
                      "Split Center Parking",
                      style: TextStyle(color: Colors.indigo),
                    )
                  ],
                ),
                Spacer(flex: 1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Car: Mercedez Benz Z3",
                      style: TextStyle(color: Colors.indigo),
                    ),
                    Text(
                      "From: " +
                          (DateFormat('MM.dd HH:mm').format(DateTime.now()))
                              .toString(),
                      style: TextStyle(color: Colors.indigo),
                    ),
                    Text(
                      "To: " +
                          (DateFormat('MM.dd HH:mm').format(
                                  DateTime.now().add(Duration(hours: 4))))
                              .toString(),
                      style: TextStyle(color: Colors.indigo),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildFrontWidget(
      BuildContext context, GlobalKey<SimpleFoldingCellState> key) {
    return Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Container(
          width: double.infinity,
          color: Colors.indigo.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Parking Pass",
                      style: TextStyle(color: Colors.indigo, fontSize: 25),
                    ),
                    Text(
                      "Parking code: #43121",
                      style: TextStyle(color: Colors.indigo),
                    ),
                    Spacer(flex: 1),
                    Text(
                      "Split Center Parking",
                      style: TextStyle(color: Colors.indigo),
                    )
                  ],
                ),
                Spacer(flex: 1),
                GestureDetector(
                  onTap: () {
                    key.currentState?.toggleFold();
                  },
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: 40,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
