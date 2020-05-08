import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parkfinder/views/main_feed/main_feed.dart';
import 'package:parkfinder/views/parking_codes/parking_codes_cell.dart';
import 'package:parkfinder/views/parking_codes/parking_codes_viewmodel.dart';
import 'package:provider/provider.dart';

// Spaghetti ahead
// In portfolio apps its also important to let others know that you can write shitty code aswell as clean code.
//
class ParkingCodes extends StatefulWidget {
  ParkingCodes({Key key}) : super(key: key);

  @override
  _ParkingCodesState createState() => _ParkingCodesState();
}

class _ParkingCodesState extends State<ParkingCodes>
    with SingleTickerProviderStateMixin {
  final _foldingCellKey = [
    GlobalKey<SimpleFoldingCellState>(),
    GlobalKey<SimpleFoldingCellState>(),
    GlobalKey<SimpleFoldingCellState>(),
    GlobalKey<SimpleFoldingCellState>(),
    GlobalKey<SimpleFoldingCellState>(),
  ];
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  //This needs a cleanup

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1300),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(begin: Offset(2, 0.0), end: Offset.zero)
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));
    _offsetAnimation.addListener(() {
      setState(() {});
    });

    _controller.forward();
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: ChangeNotifierProvider<ParkingCodesViewModel>.value(
              value: ParkingCodesViewModel(),
              child: Consumer<ParkingCodesViewModel>(
                  builder: (context, model, child) {
                return SingleChildScrollView(
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 50, left: 20, right: 20, bottom: 20),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.close,
                                size: 30,
                              ),
                            ),
                            Spacer(
                              flex: 2,
                            ),
                            Text(
                              "Parking Codes",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            Spacer(
                              flex: 3,
                            ),
                          ],
                        ),
                      ),
                      SlideTransition(
                        position: _offsetAnimation,
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: SimpleFoldingCell(
                              key: _foldingCellKey[0],
                              frontWidget: model.buildFrontWidget(
                                  context, _foldingCellKey[0]),
                              innerTopWidget: model.buildInnerTopWidget(),
                              innerBottomWidget: model.buildInnerBottomWidget(
                                  context, _foldingCellKey[0]),
                              cellSize:
                                  Size(MediaQuery.of(context).size.width, 125),
                              padding: EdgeInsets.all(15),
                              animationDuration: Duration(milliseconds: 300),
                              borderRadius: 10,
                              onOpen: () => print('0 cell opened'),
                              onClose: () => print('0 cell closed')),
                        ),
                      ),
                      SimpleFoldingCell(
                          key: _foldingCellKey[1],
                          frontWidget: model.buildFrontWidget(
                              context, _foldingCellKey[1]),
                          innerTopWidget: model.buildInnerTopWidget(),
                          innerBottomWidget: model.buildInnerBottomWidget(
                              context, _foldingCellKey[1]),
                          cellSize:
                              Size(MediaQuery.of(context).size.width, 125),
                          padding: EdgeInsets.all(15),
                          animationDuration: Duration(milliseconds: 300),
                          borderRadius: 10,
                          onOpen: () => print('0 cell opened'),
                          onClose: () => print('0 cell closed')),
                      SimpleFoldingCell(
                          key: _foldingCellKey[2],
                          frontWidget: model.buildFrontWidget(
                              context, _foldingCellKey[2]),
                          innerTopWidget: model.buildInnerTopWidget(),
                          innerBottomWidget: model.buildInnerBottomWidget(
                              context, _foldingCellKey[2]),
                          cellSize:
                              Size(MediaQuery.of(context).size.width, 125),
                          padding: EdgeInsets.all(15),
                          animationDuration: Duration(milliseconds: 300),
                          borderRadius: 10,
                          onOpen: () => print('0 cell opened'),
                          onClose: () => print('0 cell closed')),
                      SimpleFoldingCell(
                          key: _foldingCellKey[3],
                          frontWidget: model.buildFrontWidget(
                              context, _foldingCellKey[3]),
                          innerTopWidget: model.buildInnerTopWidget(),
                          innerBottomWidget: model.buildInnerBottomWidget(
                              context, _foldingCellKey[3]),
                          cellSize:
                              Size(MediaQuery.of(context).size.width, 125),
                          padding: EdgeInsets.all(15),
                          animationDuration: Duration(milliseconds: 300),
                          borderRadius: 10,
                          onOpen: () => print('0 cell opened'),
                          onClose: () => print('0 cell closed')),
                      SimpleFoldingCell(
                          key: _foldingCellKey[4],
                          frontWidget: model.buildFrontWidget(
                              context, _foldingCellKey[4]),
                          innerTopWidget: model.buildInnerTopWidget(),
                          innerBottomWidget: model.buildInnerBottomWidget(
                              context, _foldingCellKey[4]),
                          cellSize:
                              Size(MediaQuery.of(context).size.width, 125),
                          padding: EdgeInsets.all(15),
                          animationDuration: Duration(milliseconds: 300),
                          borderRadius: 10,
                          onOpen: () => print('0 cell opened'),
                          onClose: () => print('0 cell closed')),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: InkWell(
                          child: MaterialButton(
                            height: MediaQuery.of(context).size.height * 0.07,
                            minWidth: MediaQuery.of(context).size.width * 0.7,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainFeed()),
                              );
                            },
                            color: Colors.indigo,
                            elevation: 6,
                            textColor: Colors.white,
                            child: Text("Done",
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
                    ],
                  )),
                );
              }),
            )));
  }
}
