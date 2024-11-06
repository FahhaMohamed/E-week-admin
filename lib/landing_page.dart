import 'package:admin/core/widgets/logo.dart';
import 'package:admin/navigation/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const BottomNav()));
      });
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ourLogo(size: MediaQuery.of(context).size.width * .3),
      ),
    );
  }
}
