import 'package:admin/controllers/event_controller.dart';
import 'package:admin/core/contants/colors.dart';
import 'package:admin/core/utils/heading_text.dart';
import 'package:admin/core/utils/screen_width.dart';
import 'package:admin/views/detail/widgets/complete_button.dart';
import 'package:admin/views/detail/widgets/edit%20details/all_fields.dart';
import 'package:admin/views/detail/widgets/event_details.dart';
import 'package:admin/views/detail/widgets/team_score_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final EventController eventController = Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.iconColor,
            )),
        title: subHeadingText(text: eventController.event.value.eventName),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Obx(() => Column(
              children: [
                //content
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //event
                        EventDetails(
                          width: w,
                          onPress: () {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: AppColors.backgroundColor,
                                  titlePadding: const EdgeInsets.only(left: 20),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      subHeadingText(text: "Edit the details"),
                                      IconButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          icon: const Icon(
                                            Icons.close,
                                            color: AppColors.iconColor,
                                          ))
                                    ],
                                  ),
                                  content: const AllFieldsWidget(),
                                );
                              },
                            );
                          },
                        ),

                        //Teams with points

                        TeamScoreTable(width: w),

                        //complete the event
                        if (!eventController.event.value.completed)
                          const CompleteButtom(),
                      ],
                    ),
                  ),
                )
              ],
            )),
      )),
    );
  }
}
