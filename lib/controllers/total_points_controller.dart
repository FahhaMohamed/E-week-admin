import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TotalPointsController extends GetxController {
  @override
  void onInit() {
    sumOfAllEventsPoints();
    super.onInit();
  }

  var totalTeamPoints = {
    'e20': 0.obs,
    'e21': 0.obs,
    'e22': 0.obs,
    'e23': 0.obs,
  }.obs;

  Future<void> sumOfAllEventsPoints() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('events').get();

      totalTeamPoints['e20']!.value = 0;
      totalTeamPoints['e21']!.value = 0;
      totalTeamPoints['e22']!.value = 0;
      totalTeamPoints['e23']!.value = 0;

      for (var doc in querySnapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;

        int e20 = data['e20'] ?? 0;
        int e21 = data['e21'] ?? 0;
        int e22 = data['e22'] ?? 0;
        int e23 = data['e23'] ?? 0;

        totalTeamPoints['e20']!.value += e20;
        totalTeamPoints['e21']!.value += e21;
        totalTeamPoints['e22']!.value += e22;
        totalTeamPoints['e23']!.value += e23;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
