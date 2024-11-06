import 'package:admin/core/contants/colors.dart';
import 'package:admin/core/utils/heading_text.dart';
import 'package:admin/core/widgets/loading/logo_loading_widget.dart';
import 'package:admin/core/widgets/logo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EventContainer extends StatelessWidget {
  EventContainer({
    super.key,
    required this.width,
    required this.isAllEvent,
    required this.eventName,
    required this.imageUrl,
    required this.time,
    this.date,
  });

  final double width;
  final String eventName;
  final String imageUrl;
  final String time;
  final bool isAllEvent;
  String? date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors.eventContainerColor,
            AppColors.backgroundColor
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: AppColors.shadowColor,
                offset: Offset(0, 3),
                blurRadius: 5)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                eventText(text: eventName),
                if (!isAllEvent) dateText(text: time),
                if (isAllEvent)
                  Row(
                    children: [
                      dateText(text: time),
                      const SizedBox(
                        width: 35,
                      ),
                      dateText(text: date ?? ''),
                    ],
                  )
              ],
            ),
          ),
          CachedNetworkImage(
            width: width * .1,
            imageUrl: imageUrl,
            placeholder: (context, url) => LogoLoadingWidget(width: width * .1),
            errorWidget: (context, url, error) => ourLogo(size: width * .1),
          ),
        ],
      ),
    );
  }
}
