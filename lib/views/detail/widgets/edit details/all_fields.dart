import 'package:admin/controllers/event_controller.dart';
import 'package:admin/core/contants/colors.dart';
import 'package:admin/core/utils/check_validity.dart';
import 'package:admin/core/utils/screen_width.dart';
import 'package:admin/core/utils/time_date_convert.dart';
import 'package:admin/core/widgets/floating%20button/custom_text_field.dart';
import 'package:admin/core/widgets/floating%20button/event_image_picker.dart';
import 'package:admin/models/fetched_events_model.dart';
import 'package:admin/services/event_firebase_service.dart';
import 'package:admin/views/detail/widgets/edit%20details/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllFieldsWidget extends StatefulWidget {
  const AllFieldsWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AllFieldsWidgetState createState() => _AllFieldsWidgetState();
}

class _AllFieldsWidgetState extends State<AllFieldsWidget> {
  late TextEditingController eventEditingController;
  late TextEditingController totalPointsEditingController;
  late String imageUrl;
  late TextEditingController imageUrlController;
  TimeOfDay? selectedTime;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    eventEditingController =
        TextEditingController(text: eventController.event.value.eventName);
    totalPointsEditingController = TextEditingController(
        text: eventController.event.value.totalPoints.toString());
    imageUrlController =
        TextEditingController(text: eventController.event.value.imageUrl);
    imageUrl = eventController.event.value.imageUrl;

    selectedDate = convertDate(eventController.event.value.date);
    selectedTime = convertTime(eventController.event.value.time);
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

  EventController eventController = Get.put(EventController());

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
              // Event Name Input
              customTextFeild(context,
                  labelText: 'Event Text',
                  textEditingController: eventEditingController),
              const SizedBox(height: 10),
              // Event total points input
              customTextFeild(context,
                  labelText: 'Total Points',
                  keyboardType: TextInputType.number,
                  textEditingController: totalPointsEditingController),
              const SizedBox(height: 10),
              DateTimePicker(
                selectedDate: selectedDate,
                selectedTime: selectedTime,
                onSelectDate: () => _selectDate(context),
                onSelectTime: () => _selectTime(context),
              ),
              const SizedBox(height: 20),
              // Add Event Button
              CupertinoButton(
                onPressed: () async {
                  if (checkValidity(
                      eventName: eventEditingController.text,
                      totalPoints: totalPointsEditingController.text,
                      selectedDate: selectedDate,
                      selectedTime: selectedTime)) {
                    var fetchedEventsModel = FetchedEventsModel(
                        id: eventController.event.value.id,
                        eventName: eventEditingController.text,
                        imageUrl: imageUrl,
                        date: formatDateTime(selectedDate, selectedTime)[0],
                        time: formatDateTime(selectedDate, selectedTime)[1],
                        totalPoints:
                            int.parse(totalPointsEditingController.text),
                        completed: eventController.event.value.completed,
                        e20: eventController.event.value.e20.value,
                        e21: eventController.event.value.e21.value,
                        e22: eventController.event.value.e22.value,
                        e23: eventController.event.value.e23.value, 
                        staff: eventController.event.value.staff.value, 
                        );

                    //send the date to firebase
                    await eventFirebaseService.updateEvent(fetchedEventsModel);

                    eventController.updateEventDetails(fetchedEventsModel);

                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);

                    Get.snackbar('Updated', 'Event updated successfully');
                  }
                },
                color: AppColors.iconColor,
                child: const Text("Update Event"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
