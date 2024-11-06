import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AllEventsController extends GetxController {
  var isLoading = false.obs;
  var hasError = false.obs;
  var events = <QueryDocumentSnapshot<Object?>>[].obs;
  @override
  void onInit() {
    super.onInit();
    getAllEvents();
  }

  getAllEvents() async {
    try {
      isLoading(true);
      hasError(false);

      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('events').get();

      events.value = snapshot.docs;

      isLoading(false);
      print("Fetching success");
    } catch (e) {
      hasError(true);

      print("Error fetching events: $e");
    } finally {
      isLoading(false);
    }
  }

  
}
