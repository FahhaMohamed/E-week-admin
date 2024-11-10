import 'package:admin/controllers/all_events_controller.dart';
import 'package:admin/core/contants/global.dart';
import 'package:admin/views/events/widgets/all_events.dart';
import 'package:admin/views/events/widgets/day_container.dart';
import 'package:admin/views/events/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  String selectedDay = 'All';
  AllEventsController allEventsController = Get.put(AllEventsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: RefreshIndicator(
          color: Colors.red,
          backgroundColor: Colors.black,
          onRefresh: () async {
            allEventsController.getAllEvents();
          },
          child: Column(
            children: [
              //list of days -------------------------------------------------------------------------
              dateList(),

              //search functionality -------------------------------------------------------------------------
              const SearchWidget(),

              //list of events
              const AllEvents(),
            ],
          ),
        ),
      )),
    );
  }

  //list of dates in horizontal view --------------------------------------------------------------
  Container dateList() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: eventDates.length,
          itemBuilder: (context, index) => ZoomTapAnimation(
              onTap: () {
                setState(() {
                  selectedDay = eventDates[index];
                  allEventsController.filterByDate(selectedDay);
                });
              },
              child: DayContainer(
                  day: eventDates[index],
                  isSelect: selectedDay == eventDates[index]))),
    );
  }
}
