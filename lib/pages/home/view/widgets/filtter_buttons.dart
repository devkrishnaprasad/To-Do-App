import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonList extends StatefulWidget {
  @override
  _ButtonListState createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList> {
  String selectedButton = '';

  @override
  void initState() {
    super.initState();
    // Set 'All' as the initially selected button
    selectedButton = 'All';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildButton('All'),
          buildButton('Work'),
          buildButton('Personal'),
          buildButton('Workout'),
          buildButton('Shopping'),
          buildButton('Others'),
        ],
      ),
    );
  }

  Widget buildButton(String buttonText) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedButton = buttonText;
          });
          print('$buttonText Button pressed!');
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          side: BorderSide(
            color: selectedButton == buttonText
                ? const Color.fromARGB(255, 16, 53, 140)
                : const Color.fromARGB(255, 16, 53, 140),
            width: 1.w,
          ),
          backgroundColor: selectedButton == buttonText
              ? const Color.fromARGB(255, 16, 53, 140)
              : null,
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 10.sp,
            color: selectedButton == buttonText ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
