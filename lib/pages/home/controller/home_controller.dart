import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  RxString currentDate = ''.obs;
  RxString currentDay = ''.obs;

  initialSetup() {
    print("initialSetup called...");
    DateTime now = DateTime.now();
    currentDate.value = DateFormat('MMM d').format(now);
    currentDay.value = DateFormat('EEEE').format(now);
  }

  void moveDateForward() {
    DateTime currentDateValue = DateFormat('MMM d').parse(currentDate.value);
    DateTime newDate = currentDateValue.add(Duration(days: 1));
    currentDate.value = DateFormat('MMM d').format(newDate);
    currentDay.value = DateFormat('EEEE').format(newDate);
  }

  void moveDateBackward() {
    DateTime currentDateValue = DateFormat('MMM d').parse(currentDate.value);
    DateTime newDate = currentDateValue.subtract(Duration(days: 1));
    currentDate.value = DateFormat('MMM d').format(newDate);
    currentDay.value = DateFormat('EEEE').format(newDate);
  }
}
