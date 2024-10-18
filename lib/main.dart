import 'package:admin/core/contants/colors.dart';
import 'package:admin/navigation/bottom_nav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'GlacialIndifference',
        iconTheme: const IconThemeData(color: AppColors.iconColor),
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      home: const BottomNav(),
    );
  }
}