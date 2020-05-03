import 'package:flutter/material.dart';

class BookNowViewModel extends ChangeNotifier {
  List<bool> selectedFloor = [
    false,
    false,
    true
  ]; //init value - i rly should switch to BLoC
  List<List<int>> firstTable = [
    [0, 1],
    [0, 0],
    [1, 1],
    [0, 0],
    [0, 1],
    [1, 1]
  ];
  List<int> selectedSpotCord = [0, 0];

  void setFloor(int index) {
    selectedFloor = [false, false, false];
    selectedFloor[index] = true;
    notifyListeners();
  }

  String getFloor() {
    List<String> floorTitles = ["A", "B", "C", "D", "E"];
    return floorTitles[selectedFloor.indexWhere((element) => element)];
  }

  void setSpot(int x, int y) {
    selectedSpotCord = [x, y];
    notifyListeners();
  }
}
