import 'package:admin/core/utils/screen_width.dart';
import 'package:admin/core/widgets/loading/logo_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLoading(BuildContext context) {
  double w = getScreenWidth(context);
  Get.dialog(
      barrierDismissible: false,
      Dialog(
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(child: LogoLoadingWidget(width: w * .2)),
        ),
      ));
}
