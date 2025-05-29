import 'package:admin/core/contants/colors.dart';
import 'package:admin/core/utils/check_validity.dart';
import 'package:admin/core/utils/screen_width.dart';
import 'package:admin/core/widgets/floating%20button/custom_text_field.dart';
import 'package:admin/core/widgets/floating%20button/event_date_time_picker.dart';
import 'package:admin/core/widgets/floating%20button/event_image_picker.dart';
import 'package:admin/services/event_firebase_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventFormWidget extends StatefulWidget {
  const EventFormWidget({super.key});

  @override
  _EventFormWidgetState createState() => _EventFormWidgetState();
}

class _EventFormWidgetState extends State<EventFormWidget> {
  String imageUrl = "";
  late TextEditingController eventEditingController;
  late TextEditingController totalPointsEditingController;
  late TextEditingController imageUrlController;
  TimeOfDay? selectedTime;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    eventEditingController = TextEditingController();
    totalPointsEditingController = TextEditingController();
    imageUrlController = TextEditingController();
  }

  @override
  void dispose() {
    eventEditingController.dispose();
    totalPointsEditingController.dispose();
    imageUrlController.dispose();
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

 

  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);
     EventFirebaseService eventFirebaseService =
      EventFirebaseService(context: context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              EventImagePickerWidget(
                url: imageUrl,
                controller: imageUrlController,
                width: w,
                onChanged: (value) {
                  setState(() {
                    imageUrl = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              customTextFeild(context,
                  labelText: 'Event Text',
                  textEditingController: eventEditingController),
              const SizedBox(height: 10),
              customTextFeild(context,
                  labelText: 'Total Points',
                  keyboardType: TextInputType.number,
                  textEditingController: totalPointsEditingController),
              const SizedBox(height: 10),
              EventDateTimePickerWidget(
                selectedDate: selectedDate,
                selectedTime: selectedTime,
                onSelectDate: () => _selectDate(context),
                onSelectTime: () => _selectTime(context),
              ),
              const SizedBox(height: 20),
              CupertinoButton(
                onPressed: () async {
                  if (checkValidity(
                      eventName: eventEditingController.text,
                      totalPoints: totalPointsEditingController.text,
                      selectedDate: selectedDate,
                      selectedTime: selectedTime)) {
                    await eventFirebaseService.addNewEvent(
                        eventName: eventEditingController.text,
                        totalPoints:
                            int.parse(totalPointsEditingController.text),
                        imageUrl: imageUrlController.text,
                        date: selectedDate,
                        time: selectedTime);

                    setState(() {
                      imageUrlController.text = "";
                      totalPointsEditingController.text = "";
                      eventEditingController.text = "";
                      selectedDate = null;
                      selectedTime = null;
                    });
                  }
                },
                color: AppColors.iconColor,
                child: const Text("Add Event"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
