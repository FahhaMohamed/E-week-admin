import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool checkValidity(
    {required String eventName,
    required String totalPoints,
    required DateTime? selectedDate,
    required TimeOfDay? selectedTime}) {
  if (eventName.isEmpty) {
    Fluttertoast.showToast(msg: 'Please enter the Event Name');
    return false;
  } else if (totalPoints.isEmpty) {
    Fluttertoast.showToast(msg: 'Please enter the Event Total Points');
    return false;
  } else if (selectedDate == null) {
    Fluttertoast.showToast(msg: 'Please enter the Event Date');
    return false;
  } else if (selectedTime == null) {
    Fluttertoast.showToast(msg: 'Please enter the Event Time');
    return false;
  } else {
    return true;
  }
}
