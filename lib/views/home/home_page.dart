import 'package:admin/core/utils/heading_text.dart';
import 'package:admin/core/utils/screen_width.dart';
import 'package:admin/core/widgets/logo.dart';
import 'package:admin/views/home/widgets/current_events_widget.dart';
import 'package:admin/views/home/widgets/score_circles.dart';
import 'package:admin/views/home/widgets/today_events_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //score circles----------------------------------------------------

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ourLogo(size: w * .11),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    subHeadingText(text: "E Week 2K24 - Admin"),
                    dateText(text: "DAY 1")
                  ],
                ),
              ],
            ),

            ScoreCircles(),
            //today events----------------------------------------------------

            subHeadingText(text: "Current Events"),

            const SizedBox(
              height: 10,
            ),

            CurrentEventsWidget(width: w),

            const SizedBox(
              height: 20,
            ),

            //today events----------------------------------------------------

            subHeadingText(text: "Today's Events"),

            const SizedBox(
              height: 10,
            ),

            TodayEventsWidget(width: w)
          ],
        ),
      ),
    )));
  }
}
