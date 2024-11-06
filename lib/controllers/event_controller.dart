import 'package:admin/controllers/total_points_controller.dart';
import 'package:admin/models/fetched_events_model.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  
  TotalPointsController totalPointsController =
      Get.put(TotalPointsController());

  var event = FetchedEventsModel(
    id: '',
    eventName: '',
    imageUrl: '',
    date: '',
    time: '',
    totalPoints: 0,
    completed: false,
    e20: 0,
    e21: 0,
    e22: 0,
    e23: 0,
    staff: 0,
  ).obs;

  void updateEventDetails(FetchedEventsModel fetchedEventsModel) {
    event.value = fetchedEventsModel;

    event.refresh();
  }

  void increasePoints(String team) {
    switch (team) {
      case 'e20':
        if (event.value.e20 < event.value.totalPoints) {
          event.value.e20++;
          totalPointsController.totalTeamPoints['e20']!.value++;
        }
        break;
      case 'e21':
        if (event.value.e21 < event.value.totalPoints) {
          event.value.e21++;
          totalPointsController.totalTeamPoints['e21']!.value++;
        }
        break;
      case 'e22':
        if (event.value.e22 < event.value.totalPoints) {
          event.value.e22++;
          totalPointsController.totalTeamPoints['e22']!.value++;
        }
        break;
      case 'e23':
        if (event.value.e23 < event.value.totalPoints) {
          event.value.e23++;
          totalPointsController.totalTeamPoints['e23']!.value++;
        }
        break;
      case 'staff':
        if (event.value.staff < event.value.totalPoints) {
          event.value.staff++;
          totalPointsController.totalTeamPoints['staff']!.value++;
        }
        break;
      default:
        print('Invalid team');
    }
  }

  void decreasePoints(String team) {
    switch (team) {
      case 'e20':
        if (event.value.e20 > 0) {
          event.value.e20--;
          totalPointsController.totalTeamPoints['e20']!.value--;
        }
        break;
      case 'e21':
        if (event.value.e21 > 0) {
          event.value.e21--;
          totalPointsController.totalTeamPoints['e21']!.value--;
        }
        break;
      case 'e22':
        if (event.value.e22 > 0) {
          event.value.e22--;
          totalPointsController.totalTeamPoints['e22']!.value--;
        }
        break;
      case 'e23':
        if (event.value.e23 > 0) {
          event.value.e23--;
          totalPointsController.totalTeamPoints['e23']!.value--;
        }
        break;
      case 'staff':
        if (event.value.staff > 0) {
          event.value.staff--;
          totalPointsController.totalTeamPoints['staff']!.value--;
        }
        break;
      default:
        print('Invalid team');
    }
  }
}
