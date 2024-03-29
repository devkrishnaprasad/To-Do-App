import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:listzen/pages/home/controller/home_controller.dart';
import 'package:listzen/services/localstorage/operations.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  TextEditingController dateInput = TextEditingController();
  TextEditingController remainderController = TextEditingController();
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDurationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _dropdownValue;

  final HomeController _homeController = Get.find();

  @override
  void initState() {
    dateInput.text = "";
    remainderController.text = "";
    super.initState();
  }

  bool isChecked = false;
  final DBOperations _dbOperations = Get.find();

  TimeOfDay remanderTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
                child: Text(
                  "Add New Task",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
                child: TextFormField(
                  controller: taskNameController,
                  obscureText: false,
                  cursorColor: const Color.fromARGB(255, 16, 53, 140),
                  decoration: InputDecoration(
                    labelText: 'Task Name',
                    hintText: 'Enter task name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 16, 53, 140)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 16, 53, 140)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Task Name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: taskDurationController,
                  obscureText: false,
                  cursorColor: const Color.fromARGB(255, 16, 53, 140),
                  decoration: InputDecoration(
                    labelText: 'Task Duration',
                    hintText: 'Enter task duration in minutes',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 16, 53, 140)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 16, 53, 140)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Task Duration';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Select Option',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 16, 53, 140)),
                    ),
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 16, 53, 140)),
                  ),
                  value: _dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      _dropdownValue = newValue;
                    });
                  },
                  items: ['Work', 'Personal', 'Shopping', 'Workout', 'Others']
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select an option';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h),
                child: TextFormField(
                  controller: dateInput,
                  decoration: InputDecoration(
                    labelText: 'Select Date',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 16, 53, 140)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 16, 53, 140)),
                    ),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                      setState(() {
                        dateInput.text = formattedDate;
                      });
                    } else {}
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Date';
                    }
                    return null;
                  },
                ),
              ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Padding(
              //         padding:
              //             EdgeInsets.only(left: 15.w, right: 10.w, top: 15.h),
              //         child: Row(
              //           children: [
              //             Text(
              //               'Enable Remainder',
              //               style: TextStyle(
              //                 fontSize: 15.sp,
              //                 fontWeight: FontWeight.normal,
              //               ),
              //             ),
              //             Checkbox(
              //               activeColor: const Color.fromARGB(255, 16, 53, 140),
              //               value: isChecked,
              //               onChanged: (bool? value) {
              //                 setState(() {
              //                   isChecked = value!;
              //                 });
              //               },
              //             ),
              //           ],
              //         )),
              //   ],
              // ),

              Visibility(
                visible: isChecked,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h),
                  child: TextFormField(
                    controller: remainderController,
                    decoration: InputDecoration(
                      labelText: 'Remainder Time',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 16, 53, 140)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 16, 53, 140)),
                      ),
                    ),
                    readOnly: true,
                    onTap: () async {
                      final TimeOfDay? timeOfDay = await showTimePicker(
                        context: context,
                        initialTime: remanderTime,
                      );

                      if (timeOfDay != null) {
                        setState(() {
                          remanderTime = timeOfDay;
                          remainderController.text =
                              '${remanderTime.hour}: ${remanderTime.minute}: 00';
                        });
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Time';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white,
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await _dbOperations.insertData(
                            Tasks(
                              taskName: taskNameController.text,
                              taskDuration: taskDurationController.text,
                              date: dateInput.text,
                              reminderTime: remainderController.text,
                              category: _dropdownValue.toString(),
                              status: "false",
                            ),
                          );
                          await _homeController.getTaskList(
                              _homeController.formatDateString(
                                  _homeController.baseDate.value));
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 16, 53, 140),
                        ),
                      ),
                      child: const Text(
                        'Add Task',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
