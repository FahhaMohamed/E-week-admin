import 'package:admin/controllers/event_controller.dart';
import 'package:admin/core/contants/colors.dart';
import 'package:admin/services/event_firebase_service.dart';
import 'package:admin/services/points_firebase_service.dart';
import 'package:admin/views/detail/widgets/team_score_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamScoreTable extends StatefulWidget {
  final double width;
  const TeamScoreTable({super.key, required this.width});

  @override
  State<TeamScoreTable> createState() => _TeamScoreTableState();
}

EventController eventController = Get.put(EventController());
PointsFirebaseService pointsFirebaseService = PointsFirebaseService();

class _TeamScoreTableState extends State<TeamScoreTable> {
  @override
  Widget build(BuildContext context) {
    EventFirebaseService eventFirebaseService =
        EventFirebaseService(context: context);

    return Obx(() => Column(
          children: [
            //Team 1
            TeamScoresTile(
              width: widget.width,
              teamName: "E20",
              teamColor: AppColors.e20Color,
              teamScore: "${eventController.event.value.e20}",
              isCompleted: eventController.event.value.completed,
              increment: () async {
                eventController.increasePoints('e20');

                eventFirebaseService.updateEvent(eventController.event.value,
                    isScore: true);

                await pointsFirebaseService.updateTotalPoints();
              },
              decrement: () async {
                eventController.decreasePoints('e20');
                eventFirebaseService.updateEvent(eventController.event.value,
                    isScore: true);
                await pointsFirebaseService.updateTotalPoints();
              },
            ),

            const SizedBox(
              height: 20,
            ),

            //Team 2
            TeamScoresTile(
              width: widget.width,
              teamName: "E21",
              teamColor: AppColors.e21Color,
              teamScore: "${eventController.event.value.e21}",
              isCompleted: eventController.event.value.completed,
              increment: () async {
                eventController.increasePoints('e21');
                eventFirebaseService.updateEvent(eventController.event.value,
                    isScore: true);
                await pointsFirebaseService.updateTotalPoints();
              },
              decrement: () async {
                eventController.decreasePoints('e21');
                eventFirebaseService.updateEvent(eventController.event.value,
                    isScore: true);
                await pointsFirebaseService.updateTotalPoints();
              },
            ),

            const SizedBox(
              height: 20,
            ),

            //Team 3
            TeamScoresTile(
              width: widget.width,
              teamName: "E22",
              teamColor: AppColors.e22Color,
              teamScore: "${eventController.event.value.e22}",
              isCompleted: eventController.event.value.completed,
              increment: () async {
                eventController.increasePoints('e22');
                eventFirebaseService.updateEvent(eventController.event.value,
                    isScore: true);
                await pointsFirebaseService.updateTotalPoints();
              },
              decrement: () async {
                eventController.decreasePoints('e22');
                eventFirebaseService.updateEvent(eventController.event.value,
                    isScore: true);
                await pointsFirebaseService.updateTotalPoints();
              },
            ),

            const SizedBox(
              height: 20,
            ),

            //Team 4
            TeamScoresTile(
              width: widget.width,
              teamName: "E23",
              teamColor: AppColors.e23Color,
              teamScore: "${eventController.event.value.e23}",
              isCompleted: eventController.event.value.completed,
              increment: () async {
                eventController.increasePoints('e23');
                eventFirebaseService.updateEvent(eventController.event.value,
                    isScore: true);
                await pointsFirebaseService.updateTotalPoints();
              },
              decrement: () async {
                eventController.decreasePoints('e23');
                eventFirebaseService.updateEvent(eventController.event.value,
                    isScore: true);
                await pointsFirebaseService.updateTotalPoints();
              },
            ),

            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}