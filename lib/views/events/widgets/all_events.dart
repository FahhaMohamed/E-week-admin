import 'package:admin/controllers/all_events_controller.dart';
import 'package:admin/controllers/event_controller.dart';
import 'package:admin/core/utils/check_image_url.dart';
import 'package:admin/core/utils/screen_width.dart';
import 'package:admin/core/widgets/event_container.dart';
import 'package:admin/core/widgets/loading/logo_loading_widget.dart';
import 'package:admin/models/fetched_events_model.dart';
import 'package:admin/views/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AllEvents extends StatelessWidget {
  const AllEvents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);

    AllEventsController allEventsController = Get.put(AllEventsController());
    EventController eventController = Get.put(EventController());

    return Obx(() {
      if (allEventsController.isLoading.value) {
        return Center(
          child: Padding(
            padding: EdgeInsets.only(top: w * .2),
            child: LogoLoadingWidget(width: w * .5),
          ),
        );
      }

      if (allEventsController.hasError.value) {
        return const Center(child: Text("Failed to load events"));
      }

      if (allEventsController.events.isEmpty) {
        return const Center(child: Text("No events available"));
      }

      return Expanded(
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: allEventsController.events.length,
          itemBuilder: (context, index) {
            var events = allEventsController.events[index];
            var eventDoc = event(events);

            return ZoomTapAnimation(
              onTap: () {
                eventController.updateEventDetails(eventDoc);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DetailPage()));
              },
              child: EventContainer(
                width: w,
                isAllEvent: true,
                eventName: events['eventName'] ?? 'No Event Name',
                time: events['time'] ?? 'No Event Time',
                imageUrl: checkImageUrl(events),
                date: events['date'] ?? '',
              ),
            );
          },
        ),
      );
    });
  }
}
