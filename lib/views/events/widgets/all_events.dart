import 'package:admin/core/utils/screen_width.dart';
import 'package:admin/core/widgets/event_container.dart';
import 'package:flutter/material.dart';

class AllEvents extends StatelessWidget {
  const AllEvents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);

    return Expanded(
      child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return EventContainer(
              width: w,
              isAllEvent: true,
              eventName: 'Event name',
              time: '08 : 24 am',
              imageUrl: '',
            );
          }),
    );
  }
}
