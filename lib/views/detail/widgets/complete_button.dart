import 'package:admin/core/contants/colors.dart';
import 'package:admin/core/utils/heading_text.dart';
import 'package:admin/core/utils/show_loading.dart';
import 'package:admin/navigation/bottom_nav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteButtom extends StatelessWidget {
  final String docId;
  const CompleteButtom({
    super.key,
    required this.docId,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: const EdgeInsets.all(0),
        color: AppColors.successColor,
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    contentPadding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    content: SizedBox(
                      height: 30,
                      child: Column(
                        children: [
                          subHeadingText(
                              text: 'Are sure to complete this events??'),
                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.shadowColor),
                          onPressed: () => Navigator.pop(context),
                          child: eventText(text: 'No')),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.successColor,
                          ),
                          onPressed: () async {
                            showLoading(context);
                            try {
                              await FirebaseFirestore.instance
                                  .collection('events')
                                  .doc(docId)
                                  .update({
                                'completed': true,
                              });
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => const BottomNav()));
                              Get.snackbar('', 'Event successfully completed.');
                            } catch (e) {
                              Get.snackbar('', 'Fail to complete the event.');
                              Get.back();
                            } finally {
                              Get.back();
                            }
                          },
                          child: eventText(text: 'Complete'))
                    ],
                  ));
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Complete"),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.done_all)
          ],
        ));
  }
}
