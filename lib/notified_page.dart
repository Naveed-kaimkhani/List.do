import 'package:flutter/material.dart';
import 'package:get/get.dart';
class notified_page extends StatelessWidget
 {String? label;
   notified_page({this.label});
  // notified_page({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(
          onPressed:()=>Get.back(), 
          icon: Icon(Icons.arrow_back_ios)),
        title: Text(this.label!.split("|")[0]),
      ),
      body: Center(
        child:Container(
       height: 400,
       width: 300,
       color: Get.isDarkMode?Colors.white:Colors.grey[400],
       child: Text(
         this.label!.split("|")[1]),
       decoration: BoxDecoration(
         borderRadius:BorderRadius.circular(20),
          ),
       ) ,),
    );
  }
}