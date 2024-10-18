import 'package:admin/core/utils/heading_text.dart';
import 'package:admin/core/widgets/cached_image_widget.dart';
import 'package:admin/core/widgets/floating%20button/custom_text_field.dart';
import 'package:flutter/material.dart';

class EventImagePickerWidget extends StatelessWidget {
  final double width;
  final String url;
  final Function(String)? onChanged;

  final TextEditingController controller;

  const EventImagePickerWidget(
      {super.key,
      required this.width,
      this.onChanged,
      required this.controller,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedImage(width: width * .12, url: url),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width * .4,
              child: customTextFeild(context,
                  hinText: 'https://',
                  textEditingController: controller,
                  onChanged: onChanged),
            ),
            eventText(text: "Paste Image Url"),
          ],
        )
      ],
    );
  }
}


