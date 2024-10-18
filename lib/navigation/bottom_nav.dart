import 'package:admin/core/contants/colors.dart';
import 'package:admin/models/bottom_nav_model.dart';
import 'package:admin/core/widgets/floating%20button/add_event_button.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const AddEventButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        items: bottomNavItems
            .map((item) =>
                BottomNavigationBarItem(icon: item.icon, label: item.label))
            .toList(),
        selectedItemColor: AppColors.iconColor,
        unselectedItemColor: AppColors.unSelectIconColor,
        backgroundColor: AppColors.backgroundColor,
        selectedIconTheme: const IconThemeData(size: 26),
        unselectedIconTheme: const IconThemeData(size: 22),
      ),
      body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: bottomNavItems[_currentIndex].page),
    );
  }
}
