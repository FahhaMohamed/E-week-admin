import 'package:admin/controllers/event_controller.dart';
import 'package:admin/core/utils/heading_text.dart';
import 'package:admin/core/widgets/event_container.dart';
import 'package:admin/core/widgets/loading/logo_loading_widget.dart';
import 'package:admin/models/fetched_events_model.dart';
import 'package:admin/views/detail/detail_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// ignore: must_be_immutable
class CurrentEventsWidget extends StatelessWidget {
  CurrentEventsWidget({
    super.key,
    required this.width,
  });

  final double width;

  final _userStream = FirebaseFirestore.instance.collection('events');

  EventController eventController = Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _userStream.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: subHeadingText(text: 'Data loading fail.'),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LogoLoadingWidget(width: width * .5),
            );
          } else if (snapshot.hasData) {
            var doc = snapshot.data!.docs;

            return SizedBox(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: doc.length,
                  itemBuilder: (context, index) {
                    var eventDoc = event(doc[index]);

                    return ZoomTapAnimation(
                        onTap: () {
                          eventController.updateEventDetails(eventDoc);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const DetailPage()));
                        },
                        child: EventContainer(
                          eventName: eventDoc.eventName,
                          imageUrl: eventDoc.imageUrl,
                          time: eventDoc.time,
                          width: width,
                        ));
                  }),
            );
          } else {
            return Center(
              child: LogoLoadingWidget(width: width * .5),
            );
          }
        });
  }
}


/* 
StreamBuilder<QuerySnapshot>(
        stream: _userStream.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: subHeadingText(text: 'Data loading fail.'),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LogoLoadingWidget(width: width * .5),
            );
          } else if (snapshot.hasData) {
            var doc = snapshot.data!.docs;

            return SizedBox(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: doc.length,
                  itemBuilder: (context, index) {
                    return ZoomTapAnimation(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const DetailPage()));
                        },
                        child: EventContainer(
                          width: width,
                        ));
                  }),
            );
          } else {
            return Center(
              child: LogoLoadingWidget(width: width * .5),
            );
          }
        })
        */