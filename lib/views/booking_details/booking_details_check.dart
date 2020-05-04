import 'package:flutter/material.dart';

class BookingDetailsCheck extends StatelessWidget {
  const BookingDetailsCheck({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 25,
            top: 1,
            child: SizedBox(
              width: 3,
              height: 60,
              child: Container(
                color: Colors.grey,
              ),
            ),
          ),
          Positioned(
            left: 25,
            top: 60,
            child: SizedBox(
              width: 30,
              height: 3,
              child: Container(
                color: Colors.grey,
              ),
            ),
          ),
          Positioned(
            left: 25,
            top: 61,
            child: SizedBox(
              width: 3,
              height: 60,
              child: Container(
                color: Colors.grey,
              ),
            ),
          ),
          Positioned(
            left: 25,
            top: 120,
            child: SizedBox(
              width: 30,
              height: 3,
              child: Container(
                color: Colors.grey,
              ),
            ),
          ),
          Positioned(
            left: 55,
            top: 40,
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Available parking",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38)),
                )
              ],
            ),
          ),
          Positioned(
            left: 55,
            top: 100,
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Vehicle Type",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
