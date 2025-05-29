import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime convertDate(String date) {
  final DateFormat format = DateFormat('dd.MM.yyyy');
  return format.parse(date);
}

TimeOfDay convertTime(String time) {
  try {
    String trimmedTime = time.trim();

    final format = DateFormat.jm();
    final DateTime parsedTime = format.parse(trimmedTime);
    return TimeOfDay.fromDateTime(parsedTime);
  } catch (e) {
    print('Error parsing time: $e');
    return TimeOfDay.now();
  }
}


  List<String> formatDateTime(DateTime? selectedDate, TimeOfDay? selectedTime) {
    final dateTime = DateTime(
      selectedDate!.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime!.hour,
      selectedTime.minute,
    );

    String formatDate = DateFormat('dd.MM.yyyy').format(dateTime).toLowerCase();
    String formatTime = DateFormat('hh:mm a').format(dateTime).toLowerCase();

    return [formatDate, formatTime];
  }
