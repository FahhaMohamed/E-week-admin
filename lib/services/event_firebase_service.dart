import 'package:admin/core/utils/show_loading.dart';
import 'package:admin/models/event_model.dart';
import 'package:admin/models/fetched_events_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventFirebaseService {
  final BuildContext context;

  EventFirebaseService({required this.context});

  Future<void> addNewEvent(
      {required String eventName,
      required int totalPoints,
      required String imageUrl,
      required DateTime? date,
      required TimeOfDay? time}) async {
    EventModel eventModel = EventModel(
        eventName: eventName,
        imageUrl: imageUrl,
        totalPoints: totalPoints,
        selectedDate: date,
        selectedTime: time);

    var event = eventModel.eventData();

    String id = DateTime.now().millisecondsSinceEpoch.toString();

    event['completed'] = false;
    event['e20'] = 0;
    event['e21'] = 0;
    event['e22'] = 0;
    event['e23'] = 0;
    event['id'] = id;

    showLoading(context);

    try {
      await FirebaseFirestore.instance.collection("events").doc(id).set(event);
      Get.back();
      Get.snackbar('Success', "New Event Successfully added.");
    } catch (e) {
      Get.back();
      Get.snackbar('Failed', e.toString());
    }
  }

  Future<void> updateEvent(FetchedEventsModel fetchedEventModel,
      {bool isScore = false}) async {
    if (!isScore) {
      showLoading(context);
    }

    try {
      await FirebaseFirestore.instance
          .collection('events')
          .doc(fetchedEventModel.id)
          .update(fetchedEventModel.updatedEventData());
      if (!isScore) {
        Get.back();
      }
    } catch (e) {
      if (!isScore) {
        Get.back();
      }
      Get.snackbar('Failed', e.toString());
      print(e.toString());
    }
  }
}
