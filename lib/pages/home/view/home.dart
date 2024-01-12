import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:listzen/pages/add_task/view/add_task_form.dart';
import 'package:listzen/pages/home/controller/home_controller.dart';
import 'package:listzen/pages/home/view/widgets/all_list.dart';
import 'package:listzen/pages/home/view/widgets/filtter_buttons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

HomeController _homeController = Get.find();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Total', 20, Colors.blue),
      _ChartData('Complected', 12, Colors.green),
      _ChartData('Pending', 8, Colors.red),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 0.w),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Align items in the center
            children: [
              IconButton(
                onPressed: () {
                  _homeController.moveDateBackward();
                },
                icon: Padding(
                  padding: EdgeInsets.only(left: .0),
                  child: Image.asset(
                    'assets/icons/left_arrow_ic.png',
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
              ),
              Obx(
                () {
                  return InkWell(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100));

                      if (pickedDate != null) {
                        _homeController.currentDate.value =
                            DateFormat('MMM d').format(pickedDate);
                        _homeController.currentDay.value =
                            DateFormat('EEEE').format(pickedDate);
                      } else {}
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, right: 10.w, top: 0.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // Align text content to start
                        children: [
                          Text(
                            _homeController.currentDate.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _homeController.currentDay.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                onPressed: () {
                  _homeController.moveDateForward();
                },
                icon: Padding(
                  padding: EdgeInsets.only(left: 5.0.w),
                  child: Image.asset(
                    'assets/icons/right_arrow_ic.png',
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 500,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: IconButton(
              onPressed: () {},
              icon: Container(
                width: 40.0.w,
                height: 40.0.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      offset: Offset(0.0, 3.0),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.menu,
                  color: const Color.fromARGB(255, 31, 29, 29),
                  size: 25.0.sp,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ButtonList(),
              Padding(
                padding: EdgeInsets.only(
                    left: 10.w, right: 10.w, top: 18.h, bottom: 10.h),
                child: Container(
                  width: double.infinity,
                  height: 150.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w, top: 10.h),
                                        child: Image.asset(
                                          'assets/icons/task_ic.png',
                                          height: 25.h,
                                          width: 25.w,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w, top: 10.h),
                                        child: Text(
                                          "Total Task ",
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.w, top: 10.h),
                                        child: Text(
                                          "10",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w, top: 10.h),
                                        child: Image.asset(
                                          'assets/icons/complected_ic.png',
                                          height: 25.h,
                                          width: 25.w,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w, top: 10.h),
                                        child: Text(
                                          "Complected ",
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.w, top: 10.h),
                                        child: Text(
                                          "6",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w, top: 10.h),
                                        child: Image.asset(
                                          'assets/icons/pending_ic.png',
                                          height: 25.h,
                                          width: 25.w,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w, top: 10.h),
                                        child: Text(
                                          "Pending ",
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.w, top: 10.h),
                                        child: Text(
                                          "4",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h, left: 20.w),
                            child: Container(
                              width: 150.w,
                              height: 130.h,
                              child: SfCircularChart(
                                tooltipBehavior: _tooltip,
                                series: <CircularSeries<_ChartData, String>>[
                                  DoughnutSeries<_ChartData, String>(
                                    dataSource: data,
                                    xValueMapper: (_ChartData data, _) =>
                                        data.x,
                                    yValueMapper: (_ChartData data, _) =>
                                        data.y,
                                    pointColorMapper: (_ChartData data, _) =>
                                        data.color,
                                    name: 'Gold',
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 5.h,
                  left: 10.w,
                  right: 10.w,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  child: const AllListWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 61, 114, 238),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.all(16.0),
                child: const SingleChildScrollView(
                  child: AddTaskForm(),
                ),
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);

  final String x;
  final double y;

  final Color color;
}
