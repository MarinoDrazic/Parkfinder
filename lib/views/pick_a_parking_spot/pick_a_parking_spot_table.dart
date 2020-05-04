import 'package:flutter/material.dart';
import 'package:parkfinder/views/pick_a_parking_spot/pick_a_parking_spot_viewmodel.dart';

class ParkingTable extends StatelessWidget {
  ParkingTable({Key key, this.model, this.rows}) : super(key: key);
  PickAParkingSpotViewModel model;
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

  TableRow buildTableRow(int x, PickAParkingSpotViewModel model) {
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
                                  model.getFloor() +
                                      ((x + 1) * 2 - 1).toString(),
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
                                  model.getFloor() + ((x + 1) * 2).toString(),
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
