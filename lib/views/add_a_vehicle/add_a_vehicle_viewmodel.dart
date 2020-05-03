import 'package:flutter/material.dart';

class AddAVehicle extends ChangeNotifier {
  String selectedType = "Car";
  void setSelectedType(String value) {
    selectedType = value;
    notifyListeners();
  }
}
