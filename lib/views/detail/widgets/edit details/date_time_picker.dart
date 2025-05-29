import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final VoidCallback onSelectDate;
  final VoidCallback onSelectTime;

  const DateTimePicker({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.onSelectDate,
    required this.onSelectTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ListTile(
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            selectedDate != null
                ? "Date: ${DateFormat('dd.MM.yyyy').format(selectedDate!)}" 
                : "Select Date",
          ),
          subtitle: const Divider(),
          trailing: const Icon(Icons.calendar_month),
          onTap: onSelectDate,
        ),

        ListTile(
          contentPadding: const EdgeInsets.all(0),
          subtitle: const Divider(),
          title: Text(
            selectedTime != null
                ? "Time: ${selectedTime!.format(context)}" 
                : "Select Time",
          ),
          trailing: const Icon(Icons.access_time),
          onTap: onSelectTime,
        ),
      ],
    );
  }
}

