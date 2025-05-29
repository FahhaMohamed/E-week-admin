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
        height: w * .9, 
        child: Stack(
          alignment: Alignment.center,
          children: [
            
            Positioned(
              left: w * .1, 
              top: w * .12, 
              child: CircleWidget(
                label: sortedTeams[0].key.toUpperCase(),
                number: sortedTeams[0].value.value.toString(),
                diameter: w * .4,
              ),
            ),

           
            Positioned(
              right: w * .14, 
              top: w * .05, 
              child: CircleWidget(
                label: sortedTeams[1].key.toUpperCase(),
                number: sortedTeams[1].value.value.toString(),
                diameter: w * .22,
              ),
            ),

         
            Positioned(
              right: w * .11, 
              top: w * .33, 
              child: CircleWidget(
                label: sortedTeams[2].key.toUpperCase(),
                number: sortedTeams[2].value.value.toString(),
                diameter: w * .2,
              ),
            ),

           
            Positioned(
              right: w * .27, 
              top: w * .55, 
              child: CircleWidget(
                label: sortedTeams[3].key.toUpperCase(),
                number: sortedTeams[3].value.value.toString(),
                diameter: w * .18,
              ),
            ),

            
            Positioned(
              right: w * .50, 
              top: w * .65, 
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
