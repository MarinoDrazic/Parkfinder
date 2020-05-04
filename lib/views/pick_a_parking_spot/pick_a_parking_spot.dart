import 'package:flutter/material.dart';
import 'package:parkfinder/views/booking_details/booking_details.dart';
import 'package:parkfinder/views/pick_a_parking_spot/pick_a_parking_spot_table.dart';
import 'package:parkfinder/views/pick_a_parking_spot/pick_a_parking_spot_viewmodel.dart';
import 'package:parkfinder/views/subcomponents/dash_line.dart';
import 'package:provider/provider.dart';

class PickAParkingSpot extends StatefulWidget {
  PickAParkingSpot({Key key}) : super(key: key);

  @override
  _PickAParkingSpotState createState() => _PickAParkingSpotState();
}

class _PickAParkingSpotState extends State<PickAParkingSpot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<PickAParkingSpotViewModel>.value(
        value: PickAParkingSpotViewModel(),
        child: Consumer<PickAParkingSpotViewModel>(
            builder: (context, model, child) {
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
                        "Pick a parking spot",
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
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: <Widget>[
                      Spacer(flex: 5),
                      GestureDetector(
                        onTap: () {
                          model.setFloor(0);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: model.selectedFloor[0]
                                  ? Colors.orangeAccent
                                  : Colors.orangeAccent.withOpacity(0.3)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, top: 8, bottom: 8, right: 16),
                            child: Text(
                              "1st Floor",
                              style: TextStyle(
                                  color: model.selectedFloor[0]
                                      ? Colors.white
                                      : Colors.orangeAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Spacer(flex: 2),
                      GestureDetector(
                        onTap: () {
                          model.setFloor(1);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: model.selectedFloor[1]
                                  ? Colors.blueAccent
                                  : Colors.blueAccent.withOpacity(0.3)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, top: 8, bottom: 8, right: 16),
                            child: Text(
                              "2nd Floor",
                              style: TextStyle(
                                  color: model.selectedFloor[1]
                                      ? Colors.white
                                      : Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Spacer(flex: 2),
                      GestureDetector(
                        onTap: () {
                          model.setFloor(2);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: model.selectedFloor[2]
                                  ? Colors.indigo
                                  : Colors.indigo.withOpacity(0.3)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, top: 8, bottom: 8, right: 16),
                            child: Text(
                              "3rd Floor",
                              style: TextStyle(
                                  color: model.selectedFloor[2]
                                      ? Colors.white
                                      : Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Spacer(flex: 5),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          "2 WAY TRAFFIC",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: RotatedBox(
                                quarterTurns: -1,
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                  color: Colors.grey,
                                )),
                          ),
                          Dash(
                              direction: Axis.vertical,
                              dashColor: Colors.grey,
                              dashLength: 15,
                              length: MediaQuery.of(context).size.height * 0.6,
                              dashGap: 20),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  model.getFloor() + "00",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          ParkingTable(
                            model: model,
                            rows: [0, 1, 2],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  model.getFloor() + "01",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          ParkingTable(
                            model: model,
                            rows: [3, 4, 5],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                  child: MaterialButton(
                    height: MediaQuery.of(context).size.height * 0.07,
                    minWidth: MediaQuery.of(context).size.width * 0.7,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookingDetails()),
                      );
                    },
                    color: Colors.indigo,
                    elevation: 6,
                    textColor: Colors.white,
                    child: Text("Procced with Spot (" +
                        model.getFloor() +
                        ((model.selectedSpotCord[0] + 1) * 2 -
                                1 +
                                model.selectedSpotCord[1])
                            .toString() +
                        ")"),
                    padding: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
