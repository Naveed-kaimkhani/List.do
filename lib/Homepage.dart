import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do/AddTask.dart';
import 'package:to_do/TaskTile.dart';
import 'package:to_do/ThemeServices.dart';
import 'package:to_do/Themes.dart';
import 'package:to_do/taskController.dart';
import 'package:to_do/widgets/Button.dart';

import 'Themes.dart';

DateTime selecteddate = DateTime.now();
var _taskController = Get.put(taskController());

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //  final _taskController=Get.put(taskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _Appbar(),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          SizedBox(
            height: 10,
          ),
          _showTasks(),
        ],
      ),
    );
  }
}

_showTasks() {
  return Expanded(child: Obx(() {
    return ListView.builder(
      itemCount: _taskController.tasklist.length,
      itemBuilder: (_, index) {
        print(_taskController.tasklist.length);
        return AnimationConfiguration.staggeredList(
            position: index,
            child: SlideAnimation(
              child: FadeInAnimation(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _taskController.delete(_taskController.tasklist[index]);
                        _taskController.getTasks();
                      },
                      child: TaskTile(_taskController.tasklist[index]),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }));
}

_addTaskBar() {
  return Container(
    margin: EdgeInsets.only(right: 20, left: 20, top: 10),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            DateFormat.yMMMMd().format(DateTime.now()),
            style: subHeadingStyle,
          ),
          Text("Today", style: HeadingStyle)
        ]),
      ),
      Button(
          label: "+ Add Task",
          ontap: () async {
            await Get.to(() => AddTask());
            _taskController.getTasks();
          }),
    ]),
  );
}

_addDateBar() {
  return Container(
    margin: EdgeInsets.only(top: 20, left: 20),
    child: DatePicker(
      DateTime.now(),
      height: 100,
      width: 80,
      initialSelectedDate: DateTime.now(),
      selectionColor: bluish,
      selectedTextColor: Colors.white,
      dateTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      monthTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      dayTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      onDateChange: (date) {
        selecteddate = date;
      },
    ),
  );
}

_Appbar() {
  return AppBar(
    //backgroundColor:c,
    elevation: 0,
    leading: GestureDetector(
      child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 25),
      onTap: () {
        ThemeServices().SwitchTheme();
      },
    ),
    actions: [
      Icon(Icons.person, size: 25),
    ],
  );
}
