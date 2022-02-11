import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/AddTask.dart';
import 'package:to_do/Themes.dart';
class Button extends StatelessWidget {
  final String label;
  const Button({ Key? key ,required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:navigate,
      child: Container(
        width: 100,
        height: 50,
        child: Center(child: Text(label,style: TextStyle(color: Colors.white,),)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bluish,
        ),
      ),
    );
  }
}

navigate(){
  Get.to(AddTask());
}