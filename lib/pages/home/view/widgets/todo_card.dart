import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listzen/pages/home/controller/home_controller.dart';
import 'package:listzen/services/localstorage/operations.dart';

class TodoCardWidget extends StatefulWidget {
  final String id;
  final String name;
  final String duration;
  final String category;
  // ignore: prefer_typing_uninitialized_variables
  final status;

  const TodoCardWidget(
      {Key? key,
      required this.id,
      required this.name,
      required this.duration,
      required this.category,
      required this.status})
      : super(key: key);

  @override
  State<TodoCardWidget> createState() => _TodoCardWidgetState();
}

final Map<String, String> categoryImageMap = {
  'Work': 'assets/icons/work_ic.png',
  'Personal': 'assets/icons/personal_ic.png',
  'Shopping': 'assets/icons/shopping_ic.png',
  'Workout': 'assets/icons/workout_ic.png',
  'Others': 'assets/icons/others_ic.png',
};

final DBOperations _dbOperations = Get.find();
final HomeController _homeController = Get.find();

class _TodoCardWidgetState extends State<TodoCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        bottom: 5.h,
      ),
      child: Container(
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.status == "true" ? Colors.green : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              categoryImageMap[widget.category].toString(),
              width: 50.w,
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: widget.status == "true"
                            ? Colors.white
                            : Colors.black),
                  ),
                  Text(
                    "Estimated time : ${widget.duration} min",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 10.sp,
                      color:
                          widget.status == "true" ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: Visibility(
                visible: widget.status == "true",
                child: Image.asset(
                  "assets/icons/done_ic.png",
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ),
            Visibility(
              visible: widget.status == "false",
              child: PopupMenuButton<int>(
                icon: Icon(
                  Icons.more_horiz,
                  size: 23.0.dg,
                  color: Colors.grey,
                ),
                color: const Color.fromARGB(255, 51, 90, 183),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onSelected: (int value) async {
                  if (value == 1) {
                    await _dbOperations.deleteData(int.parse(widget.id));

                    await _homeController.getTaskList(_homeController
                        .formatDateString(_homeController.baseDate.value));
                  }
                  if (value == 2) {
                    await _dbOperations.updateStatus(int.parse(widget.id));

                    await _homeController.getTaskList(_homeController
                        .formatDateString(_homeController.baseDate.value));
                  }
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      children: [
                        const Icon(Icons.delete, color: Colors.white),
                        SizedBox(width: 8.0.w),
                        const Text('Delete',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Row(
                      children: [
                        const Icon(Icons.check, color: Colors.white),
                        SizedBox(width: 8.0.w),
                        const Text('Completed',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
