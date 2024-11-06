import 'package:admin/controllers/all_events_controller.dart';
import 'package:admin/controllers/event_controller.dart';
import 'package:admin/controllers/total_points_controller.dart';
import 'package:get/get.dart';

deleteMemory() {
  Get.delete<EventController>();
  Get.delete<TotalPointsController>();
  Get.delete<AllEventsController>();
}
