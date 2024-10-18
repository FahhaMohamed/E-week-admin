import 'package:admin/core/widgets/event_container.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class TodayEventsWidget extends StatelessWidget {
  const TodayEventsWidget({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, index) {
            return ZoomTapAnimation(child: EventContainer(width: width,
            eventName: 'Event name', time: '08 : 24 am', imageUrl: '',));
          }),
    );
  }
}
