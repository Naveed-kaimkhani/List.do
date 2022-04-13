import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/task.dart';

import 'Themes.dart';

class taskView extends StatelessWidget {
  String? taskk;
  taskView({this.taskk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(),
      body: Center(
          child: Column(
        children: [
          paddingOnly(top: 40),
          Text("Hellow, Naveed"),
          Text("You have a new Reminder"),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 400,
            width: 300,
            decoration: BoxDecoration(
              color: bluish,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(children: [
              show_task(Icon(Icons.title), taskk!.split('|')[0],
                  taskk!.split('|')[1]),
            ]),
          )
        ],
      )),
    );
  }

  AppBar app_bar() {
    return AppBar(
      
      title: Text(taskk!.split('|')[0]),
      leading: GestureDetector(
        child: Icon(Icons.arrow_left_rounded),
        onTap: Get.back,
      ),
      elevation: 0,
      backgroundColor: bluish,
    );
  }

  Widget show_task(Widget icon, String title, String subtitle) {
    return ListTile(
      leading: icon,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
