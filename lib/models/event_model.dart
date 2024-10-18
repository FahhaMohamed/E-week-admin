import 'package:admin/core/utils/time_date_convert.dart';
import 'package:flutter/material.dart';

class EventModel {
  final String eventName;
  final int totalPoints;
  final String imageUrl;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;

  EventModel(
      {required this.eventName,
      required this.imageUrl,
      required this.totalPoints,
      required this.selectedDate,
      required this.selectedTime});

  Map<String, dynamic> eventData() {
    Map<String, dynamic> event = {
      'eventName': eventName,
      'date': formatDateTime(selectedDate, selectedTime)[0],
      'time': formatDateTime(selectedDate, selectedTime)[1],
      'totalPoints': totalPoints,
    };

    if (imageUrl.isNotEmpty) {
      event.update('imageUrl', (_) => imageUrl, ifAbsent: () => imageUrl);
    }

    return event;
  }
}
