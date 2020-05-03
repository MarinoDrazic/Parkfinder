import 'package:flutter/material.dart';
import 'package:parkfinder/views/book_now/book_now_viewmodel.dart';
import 'package:parkfinder/views/subcomponents/dash_line.dart';
import 'package:provider/provider.dart';

class BookNow extends StatefulWidget {
  BookNow({Key key}) : super(key: key);

  @override
  _BookNowState createState() => _BookNowState();
}

class _BookNowState extends State<BookNow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<BookNowViewModel>.value(
        value: BookNowViewModel(),
        child: Consumer<BookNowViewModel>(builder: (context, model, child) {
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
                        MaterialPageRoute(builder: (context) => BookNow()),
                      );
                    },
                    color: Colors.indigo,
                    elevation: 6,
                    textColor: Colors.white,
                    child: Text("Procced with Spot (" +
                        model.getFloor() +
                        (model.selectedSpotCord[0] +
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

class ParkingTable extends StatelessWidget {
  ParkingTable({Key key, this.model, this.rows}) : super(key: key);
  BookNowViewModel model;
  List<int> rows;
  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth:
          FixedColumnWidth(MediaQuery.of(context).size.width / 3),
      border: TableBorder.symmetric(
          inside: BorderSide(
              color: Colors.black26, width: 1, style: BorderStyle.solid)),
      children: [
        buildTableRow(rows[0], model),
        buildTableRow(rows[1], model),
        buildTableRow(rows[2], model),
      ],
    );
  }

  TableRow buildTableRow(int x, BookNowViewModel model) {
    return TableRow(children: [
      TableCell(
          child: model.firstTable[x][0] == 1
              ? SizedBox(
                  width: 200,
                  height: 100,
                  child: Icon(
                    Icons.directions_car,
                    size: 60,
                  ),
                )
              : GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    model.setSpot(x, 0);
                  },
                  child: SizedBox(
                    width: 200,
                    height: 100,
                    child: model.selectedSpotCord[0] == x &&
                            model.selectedSpotCord[1] == 0
                        ? Container(
                            color: Colors.blueAccent.withOpacity(0.3),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "Selected",
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                  child: Container(
                                    color: Colors.blueAccent,
                                  ),
                                )
                              ],
                            ),
                          )
                        : Stack(
                            children: <Widget>[
                              Positioned(
                                child: Text(
                                  model.getFloor() + (x + 1).toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                bottom: 8,
                                left: 8,
                              )
                            ],
                          ),
                  ),
                )),
      TableCell(
          child: model.firstTable[x][1] == 1
              ? SizedBox(
                  width: 200,
                  height: 100,
                  child: Icon(
                    Icons.directions_car,
                    size: 60,
                  ),
                )
              : GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    model.setSpot(x, 1);
                  },
                  child: SizedBox(
                    width: 200,
                    height: 100,
                    child: model.selectedSpotCord[0] == x &&
                            model.selectedSpotCord[1] == 1
                        ? Container(
                            color: Colors.blueAccent.withOpacity(0.3),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "Selected",
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                  child: Container(
                                    color: Colors.blueAccent,
                                  ),
                                )
                              ],
                            ),
                          )
                        : Stack(
                            children: <Widget>[
                              Positioned(
                                child: Text(
                                  model.getFloor() + (x + 2).toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                bottom: 8,
                                right: 8,
                              )
                            ],
                          ),
                  ),
                )),
    ]);
  }
}
