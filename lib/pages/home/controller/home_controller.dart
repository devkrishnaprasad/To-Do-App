import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:listzen/services/localstorage/operations.dart';

DBOperations _dbOperations = Get.find();

class HomeController extends GetxController {
  RxString baseDate = ''.obs;
  RxString currentDate = ''.obs;
  RxString currentDay = ''.obs;
  RxString currentTab = 'All'.obs;
  RxBool isTaskEmpty = false.obs;
  RxBool isRefreshing = false.obs;
  List<Tasks> tasksList = [];

  List<Tasks> workList = [];
  List<Tasks> personalList = [];
  List<Tasks> workoutList = [];
  List<Tasks> shoppingList = [];
  List<Tasks> othersList = [];

  initialSetup() {
    DateTime now = DateTime.now();
    baseDate.value = now.toString();
    currentDate.value = DateFormat('MMM d').format(now);
    currentDay.value = DateFormat('EEEE').format(now);
  }

  String changeDate(bool forward) {
    DateTime currentDateValue = DateFormat('yyyy-MM-dd').parse(baseDate.value);
    DateTime newDate = forward
        ? currentDateValue.add(const Duration(days: 1))
        : currentDateValue.subtract(const Duration(days: 1));

    DateFormat formatter = DateFormat('dd-MM-yyyy');

    baseDate.value = DateFormat('yyyy-MM-dd HH:mm:ss.SSSSSS').format(newDate);
    currentDate.value = DateFormat('MMM d').format(newDate);
    currentDay.value = DateFormat('EEEE').format(newDate);

    return formatter.format(newDate);
  }

  getTaskList(date) async {
    isRefreshing.value = true;
    tasksList = await _dbOperations.getDataForCurrentDate(date);
    workList = tasksList.where((task) => task.category == "Work").toList();
    personalList =
        tasksList.where((task) => task.category == "Personal").toList();
    shoppingList =
        tasksList.where((task) => task.category == "Shopping").toList();
    workoutList =
        tasksList.where((task) => task.category == "Workout").toList();
    othersList = tasksList.where((task) => task.category == "Others").toList();
    isTaskEmpty.value = tasksList.isEmpty ? true : false;

    Future.delayed(const Duration(milliseconds: 50), () {
      isRefreshing.value = false;
    });
  }

  String formatDateString(String originalString) {
    // Parse the original string into a DateTime object
    DateTime dateTime = DateTime.parse(originalString);

    // Format the DateTime object into the desired string format
    String formattedString = "${dateTime.day.toString().padLeft(2, '0')}-"
        "${dateTime.month.toString().padLeft(2, '0')}-"
        "${dateTime.year}";

    return formattedString;
  }
}
