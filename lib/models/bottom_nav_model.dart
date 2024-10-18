import 'package:admin/views/events/events_page.dart';
import 'package:admin/views/home/home_page.dart';
import 'package:flutter/material.dart';

class BottomNavModel {
  final Icon icon;
  final String label;
  final Widget page;

  BottomNavModel({required this.icon, required this.label, required this.page});
}

List<BottomNavModel> bottomNavItems = [
  BottomNavModel(
    icon: const Icon(Icons.home_rounded),
    label: "Home",
    page: const HomePage(),
  ),
  BottomNavModel(
    icon: const Icon(Icons.calendar_month_rounded),
    label: "Events",
    page: const EventsPage(),
  ),
];
