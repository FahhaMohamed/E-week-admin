import 'package:admin/controllers/total_points_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PointsFirebaseService {
  TotalPointsController totalPointsController =
      Get.put(TotalPointsController());
  Future<void> updateTotalPoints() async {
    try {
      await FirebaseFirestore.instance
          .collection('points')
          .doc('total-points')
          .set({
        'e20': totalPointsController.totalTeamPoints['e20']!.value,
        'e21': totalPointsController.totalTeamPoints['e21']!.value,
        'e22': totalPointsController.totalTeamPoints['e22']!.value,
        'e23': totalPointsController.totalTeamPoints['e23']!.value,
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
