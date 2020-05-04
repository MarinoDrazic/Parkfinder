import 'package:flutter/material.dart';

class BookingDetailsViewModel extends ChangeNotifier {
  List<String> bookingTimes = [
    "1 hour",
    "2 hours",
    "4 hours",
    "8 hours",
    "12 hours",
    "24 hours",
    "3 days",
    "7 days",
  ];
  List<String> bookingPrices = [
    "5",
    "10",
    "20",
    "30",
    "40",
    "50",
    "80",
    "100",
  ];
  int selectedTime = 0;
  void setSelectedTime(int index) {
    selectedTime = index;
    notifyListeners();
  }
}
