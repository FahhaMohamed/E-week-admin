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

    return Obx(() => SizedBox(
          height: w * .8, //330
          child: Stack(
            alignment: Alignment.center,
            children: [
              // first place circle
              Positioned(
                left: w * .1, //50
                top: w * .12, //60
                child: CircleWidget(
                  label: 'E21',
                  number: totalPointsController.totalTeamPoints['e21']!.value
                      .toString(),
                  diameter: w * .4,
                ),
              ),

              // second place circle
              Positioned(
                right: w * .14, //60
                top: w * .05, //20
                child: CircleWidget(
                  label: 'E20',
                  number: totalPointsController.totalTeamPoints['e20']!.value
                      .toString(),
                  diameter: w * .22,
                ),
              ),

              // third place circle
              Positioned(
                right: w * .11, //40
                top: w * .33, //130
                child: CircleWidget(
                  label: 'E22',
                  number: totalPointsController.totalTeamPoints['e22']!.value
                      .toString(),
                  diameter: w * .2,
                ),
              ),

              // fourth place circle
              Positioned(
                right: w * .27, //100
                top: w * .55, //100
                child: CircleWidget(
                  label: 'E23',
                  number: totalPointsController.totalTeamPoints['e23']!.value
                      .toString(),
                  diameter: w * .18,
                ),
              ),
            ],
          ),
        ));
  }
}
