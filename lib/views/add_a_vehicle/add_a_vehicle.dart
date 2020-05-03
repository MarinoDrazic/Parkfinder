import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parkfinder/views/add_a_vehicle/add_a_vehicle_viewmodel.dart';
import 'package:parkfinder/views/book_now/book_now.dart';
import 'package:provider/provider.dart';

class AddACar extends StatelessWidget {
  AddACar({Key key}) : super(key: key);
  List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  String _selectedLocation; // Option 2
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<AddAVehicle>.value(
          value: AddAVehicle(),
          child: Consumer<AddAVehicle>(builder: (context, model, child) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
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
                          "Add a Vehicle",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Spacer(
                          flex: 3,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Image.asset("assets/addacar.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      "Vehicle details",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, top: 8),
                    child: Text(
                      "Add your vehicle details below",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: <Widget>[
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16)),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.11,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Icon(
                                      Icons.directions_car,
                                      color: Colors.indigo,
                                      size: 40,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("TYPE",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          )),
                                      Theme(
                                        data: Theme.of(context).copyWith(
                                          canvasColor: Colors.white,
                                        ),
                                        child: DropdownButton<String>(
                                          icon: RotatedBox(
                                              quarterTurns: -1,
                                              child:
                                                  Icon(Icons.arrow_back_ios)),
                                          underline: SizedBox(),
                                          hint: Text(
                                            model.selectedType,
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          onChanged: (String newValue) {
                                            model.setSelectedType(newValue);
                                          },
                                          items: <String>[
                                            'Car',
                                            'Taxi',
                                            'Bus',
                                            'Motorcycle'
                                          ].map((String value) {
                                            return new DropdownMenuItem<String>(
                                              value: value,
                                              child: Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child: Icon(
                                                      value == "Car"
                                                          ? Icons.directions_car
                                                          : value == "Bus"
                                                              ? Icons
                                                                  .directions_bus
                                                              : value == "Taxi"
                                                                  ? Icons
                                                                      .local_taxi
                                                                  : Icons
                                                                      .directions_bike,
                                                      color: Colors.indigo,
                                                    ),
                                                  ),
                                                  new Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(value),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: <Widget>[
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16)),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.11,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Icon(
                                      Icons.crop_7_5,
                                      color: Colors.indigo,
                                      size: 40,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("LICENSE PLATE NO",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          )),
                                      SizedBox(
                                          width: 150,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'ST123AB'),
                                          ))
                                    ],
                                  ),
                                  Spacer(flex: 1),
                                  GestureDetector(
                                    onTap: () {
                                      Fluttertoast.showToast(
                                          msg: "TODO",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          fontSize: 16.0);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.indigo.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 16.0,
                                              bottom: 16,
                                              left: 8,
                                              right: 8),
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Colors.indigo,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: <Widget>[
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16)),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.11,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Icon(
                                      Icons.settings,
                                      color: Colors.indigo,
                                      size: 40,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("CAR MODEL",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          )),
                                      Text("Mercedez Benz Z3",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          )),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
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
                        child: Text("Add Vehicle",
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
          })),
    );
  }
}
