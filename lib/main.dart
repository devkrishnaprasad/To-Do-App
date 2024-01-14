import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:listzen/pages/home/controller/home_controller.dart';
import 'package:listzen/pages/onboard_screen/onboard_screen.dart';
import 'package:listzen/services/localstorage/operations.dart';

HomeController _homeController = Get.put(HomeController());
DBOperations _dbOperations = Get.put(DBOperations());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _dbOperations.initDatabase();
  _homeController.initialSetup();
  String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  await _homeController.getTaskList(currentDate);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          ),
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: const OnBoardScreen(),
      // child: const HomePage(),
    );
  }
}
