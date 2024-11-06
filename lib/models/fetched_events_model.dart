import 'package:admin/core/utils/check_image_url.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FetchedEventsModel {
  final String id;
  final String eventName;
  final String imageUrl;
  final String date;
  final String time;
  final int totalPoints;
  RxInt e20;
  RxInt e21;
  RxInt e22;
  RxInt e23;
  RxInt staff;
  final bool completed;

  FetchedEventsModel(
      {required this.id,
      required this.eventName,
      required this.imageUrl,
      required this.date,
      required this.time,
      required this.totalPoints,
      required this.completed,
      required int e20,
      required int e21,
      required int e22,
      required int e23,
      required int staff})
      : e20 = e20.obs,
        e21 = e21.obs,
        e22 = e22.obs,
        e23 = e23.obs,
        staff = staff.obs;

  Map<String, dynamic> updatedEventData() {
    var updatedEvent = {
      'id': id,
      'eventName': eventName,
      'imageUrl': imageUrl,
      'date': date,
      'time': time,
      'totalPoints': totalPoints,
      'e20': e20.value,
      'e21': e21.value,
      'e22': e22.value,
      'e23': e23.value,
      'staff': staff.value,
      'completed': completed,
    };

    return updatedEvent;
  }
}

FetchedEventsModel event(QueryDocumentSnapshot<Object?> doc) {
  final eventDoc = FetchedEventsModel(
      id: doc['id'],
      eventName: doc['eventName'],
      imageUrl: checkImageUrl(doc),
      date: doc['date'],
      time: doc['time'],
      totalPoints: doc['totalPoints'],
      completed: doc['completed'],
      e20: doc['e20'],
      e21: doc['e21'],
      e22: doc['e22'],
      e23: doc['e23'],
      staff: doc['staff'],
      );

  return eventDoc;
}
