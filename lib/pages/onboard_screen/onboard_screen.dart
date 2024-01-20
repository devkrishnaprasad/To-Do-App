import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listzen/pages/home/view/home.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      Get.to(const HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 53, 90, 177),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 53, 90, 177),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100.h),
              child: Semantics(
                label: 'Listzen Logo',
                child: SizedBox(
                  width: 200.w,
                  height: 200.h,
                  child: Image.asset(
                    "assets/icons/onboard_ic.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Text(
                'Listzen.',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
