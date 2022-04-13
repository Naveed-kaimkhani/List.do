import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/Themes.dart';
class notified_page extends StatelessWidget
 {String? label;
   notified_page({this.label});
  // notified_page({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:bluish,
        leading:IconButton(
          onPressed:()=>Get.back(), 
          icon: Icon(Icons.arrow_back_ios)),
        title: Center(child: Text(this.label!.split("|")[0],style: HeadingStyle,)),
      ),
      body: Center(
        child:Container(
          color: bluish,
       height: 400,
       width: 300,
      //  color: Get.isDarkMode?Colors.white:Colors.grey[400],
       child: Text(
         this.label!.split("|")[1]),
       decoration: BoxDecoration(
         color: Get.isDarkMode?Colors.white:Colors.grey[400],
         borderRadius:BorderRadius.circular(20),
          ),
       ) ,),
    );
  }
}