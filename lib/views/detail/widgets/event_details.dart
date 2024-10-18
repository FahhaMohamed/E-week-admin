import 'package:admin/controllers/event_controller.dart';
import 'package:admin/core/contants/colors.dart';
import 'package:admin/core/utils/heading_text.dart';
import 'package:admin/core/widgets/loading/logo_loading_widget.dart';
import 'package:admin/core/widgets/logo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventDetails extends StatelessWidget {
  final double width;

  final VoidCallback onPress;

  EventDetails({
    super.key,
    required this.width,
    required this.onPress,
  });

  final EventController eventController = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          width: width * .4,
          imageUrl: eventController.event.value.imageUrl,
          placeholder: (context, url) => LogoLoadingWidget(width: width * .4),
          errorWidget: (context, url, error) => ourLogo(size: width * .4),
        ),
        const SizedBox(
          height: 5,
        ),
        subHeadingText(
            text: 'Total points: ${eventController.event.value.totalPoints}'),
        const SizedBox(
          height: 20,
        ),
        eventText(text: eventController.event.value.time),
        dateText(text: eventController.event.value.date),
        const SizedBox(
          height: 5,
        ),
        CupertinoButton(
            padding: const EdgeInsets.all(0),
            color: AppColors.iconColor,
            onPressed: onPress,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Edit Details"),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.edit)
              ],
            )),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
