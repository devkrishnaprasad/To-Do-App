import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listzen/pages/home/controller/home_controller.dart';
import 'package:listzen/pages/home/view/widgets/todo_card.dart';

HomeController _homeController = Get.find();

class AllListWidget extends StatefulWidget {
  const AllListWidget({Key? key}) : super(key: key);

  @override
  State<AllListWidget> createState() => _AllListWidgetState();
}

class _AllListWidgetState extends State<AllListWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          Visibility(
            visible: (_homeController.workList.isNotEmpty &&
                (_homeController.currentTab.value == 'All' ||
                    _homeController.currentTab.value == 'Work')),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                maintainState: true,
                initiallyExpanded: true,
                iconColor: Colors.grey,
                title: Text(
                  'Work',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                children: <Widget>[
                  SizedBox(
                    child: ListView.builder(
                      itemCount: _homeController.workList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return TodoCardWidget(
                          status: _homeController.workList[index].status,
                          id: _homeController.workList[index].id.toString(),
                          name: _homeController.workList[index].taskName,
                          duration:
                              _homeController.workList[index].taskDuration,
                          category: _homeController.workList[index].category,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: (_homeController.personalList.isNotEmpty &&
                (_homeController.currentTab.value == 'All' ||
                    _homeController.currentTab.value == 'Personal')),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                maintainState: true,
                initiallyExpanded: true,
                iconColor: Colors.grey,
                title: Text(
                  'Personal',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                children: <Widget>[
                  SizedBox(
                    child: ListView.builder(
                      itemCount: _homeController.personalList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return TodoCardWidget(
                          status: _homeController.personalList[index].status,
                          id: _homeController.personalList[index].id.toString(),
                          name: _homeController.personalList[index].taskName,
                          duration:
                              _homeController.personalList[index].taskDuration,
                          category:
                              _homeController.personalList[index].category,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: (_homeController.workoutList.isNotEmpty &&
                (_homeController.currentTab.value == 'All' ||
                    _homeController.currentTab.value == 'Workout')),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                maintainState: true,
                initiallyExpanded: true,
                iconColor: Colors.grey,
                title: Text(
                  'Workout',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                children: <Widget>[
                  SizedBox(
                    child: ListView.builder(
                      itemCount: _homeController.workoutList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return TodoCardWidget(
                          status: _homeController.workoutList[index].status,
                          id: _homeController.workoutList[index].id.toString(),
                          name: _homeController.workoutList[index].taskName,
                          duration:
                              _homeController.workoutList[index].taskDuration,
                          category: _homeController.workoutList[index].category,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: (_homeController.shoppingList.isNotEmpty &&
                (_homeController.currentTab.value == 'All' ||
                    _homeController.currentTab.value == 'Shopping')),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                maintainState: true,
                initiallyExpanded: true,
                iconColor: Colors.grey,
                title: Text(
                  'Shopping',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                children: <Widget>[
                  SizedBox(
                    child: ListView.builder(
                      itemCount: _homeController.shoppingList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return TodoCardWidget(
                          status: _homeController.shoppingList[index].status,
                          id: _homeController.shoppingList[index].id.toString(),
                          name: _homeController.shoppingList[index].taskName,
                          duration:
                              _homeController.shoppingList[index].taskDuration,
                          category:
                              _homeController.shoppingList[index].category,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: (_homeController.othersList.isNotEmpty &&
                (_homeController.currentTab.value == 'All' ||
                    _homeController.currentTab.value == 'Others')),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                maintainState: true,
                initiallyExpanded: true,
                iconColor: Colors.grey,
                title: Text(
                  'Others',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                children: <Widget>[
                  SizedBox(
                    child: ListView.builder(
                      itemCount: _homeController.othersList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return TodoCardWidget(
                          status: _homeController.othersList[index].status,
                          id: _homeController.othersList[index].id.toString(),
                          name: _homeController.othersList[index].taskName,
                          duration:
                              _homeController.othersList[index].taskDuration,
                          category: _homeController.othersList[index].category,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
