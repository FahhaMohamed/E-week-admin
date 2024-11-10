import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AllEventsController extends GetxController {
  var isLoading = false.obs;
  var hasError = false.obs;
   var fetchedEvents = <QueryDocumentSnapshot<Object?>>[].obs;
  var events = <QueryDocumentSnapshot<Object?>>[].obs;
   String dateFormat = '11.2024';
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

      fetchedEvents.value = snapshot.docs;
      events.assignAll(fetchedEvents);

      isLoading(false);
      print("Fetching success");
    } catch (e) {
      hasError(true);

      print("Error fetching events: $e");
    } finally {
      isLoading(false);
    }
  }

  filterByDate(String date) {
    if (date == 'All' || date.isEmpty) {
      events.value = fetchedEvents.value;
    } else {
      events.value =
          fetchedEvents.where((event) => event['date'] == "$date.$dateFormat").toList();
    }

    print(date);
  }

  
}
