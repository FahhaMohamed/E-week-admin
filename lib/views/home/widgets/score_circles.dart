import 'package:admin/controllers/total_points_controller.dart';
import 'package:admin/core/utils/screen_width.dart';
import 'package:admin/views/home/widgets/circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ScoreCircles extends StatelessWidget {
  ScoreCircles({super.key});

  TotalPointsController totalPointsController =
      Get.put(TotalPointsController());

  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);

    return Obx(() {
      var sortedTeams = totalPointsController.totalTeamPoints.entries.toList()
        ..sort((a, b) => b.value.value.compareTo(a.value.value));
      return SizedBox(
        height: w * .9, //330
        child: Stack(
          alignment: Alignment.center,
          children: [
            // first place circle
            Positioned(
              left: w * .1, //50
              top: w * .12, //60
              child: CircleWidget(
                label: sortedTeams[0].key.toUpperCase(),
                number: sortedTeams[0].value.value.toString(),
                diameter: w * .4,
              ),
            ),

            // second place circle
            Positioned(
              right: w * .14, //60
              top: w * .05, //20
              child: CircleWidget(
                label: sortedTeams[1].key.toUpperCase(),
                number: sortedTeams[1].value.value.toString(),
                diameter: w * .22,
              ),
            ),

            // third place circle
            Positioned(
              right: w * .11, //40
              top: w * .33, //130
              child: CircleWidget(
                label: sortedTeams[2].key.toUpperCase(),
                number: sortedTeams[2].value.value.toString(),
                diameter: w * .2,
              ),
            ),

            // fourth place circle
            Positioned(
              right: w * .27, //100
              top: w * .55, //100
              child: CircleWidget(
                label: sortedTeams[3].key.toUpperCase(),
                number: sortedTeams[3].value.value.toString(),
                diameter: w * .18,
              ),
            ),

            // fifth place circle
            Positioned(
              right: w * .50, //100
              top: w * .65, //100
              child: CircleWidget(
                label: sortedTeams[4].key.toUpperCase(),
                number: sortedTeams[4].value.value.toString(),
                diameter: w * .15,
              ),
            ),
          ],
        ),
      );
    });
  }
}
