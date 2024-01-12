import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listzen/pages/home/view/widgets/todo_card.dart';

class AllListWidget extends StatefulWidget {
  const AllListWidget({Key? key}) : super(key: key);

  @override
  State<AllListWidget> createState() => _AllListWidgetState();
}

class _AllListWidgetState extends State<AllListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
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
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const TodoCardWidget();
                  },
                ),
              ),
            ],
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
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
                  itemCount: 1,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const TodoCardWidget();
                  },
                ),
              ),
            ],
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
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
                  itemCount: 1,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const TodoCardWidget();
                  },
                ),
              ),
            ],
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
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
                  itemCount: 1,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const TodoCardWidget();
                  },
                ),
              ),
            ],
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
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
                  itemCount: 1,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const TodoCardWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
