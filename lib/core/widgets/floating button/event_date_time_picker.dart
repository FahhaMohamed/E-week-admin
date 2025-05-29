import 'package:flutter/material.dart';
import 'package:admin/core/utils/heading_text.dart';

class EventDateTimePickerWidget extends StatelessWidget {
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final VoidCallback onSelectDate;
  final VoidCallback onSelectTime;

  const EventDateTimePickerWidget({
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
          title: eventText(
            text: selectedDate != null
                ? "Date: ${selectedDate!.toLocal().toString().split(' ')[0]}"
                : "Select Date",
          ),
          subtitle: const Divider(),
          trailing: const Icon(Icons.calendar_month),
          onTap: onSelectDate,
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          subtitle: const Divider(),
          title: eventText(
            text: selectedTime != null
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
