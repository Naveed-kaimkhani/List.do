import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:to_do/Themes.dart';
import 'package:to_do/task.dart';
import 'package:to_do/TaskTile.dart';
import 'package:to_do/taskController.dart';

class completed_task extends StatefulWidget {
  completed_task({Key? key}) : super(key: key);

  @override
  State<completed_task> createState() => _completed_taskState();
}

class _completed_taskState extends State<completed_task> {
  var _taskController = Get.put(taskController());
  task? taskk;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
       // title: Text('Completed Tasks'),
        backgroundColor: bluish,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        )
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 70.0), //,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "All Your ",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          "Completed Task",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        )
                      ],
                    ),
                  ),
                  Container(
                      height: 190,
                      width: 170,
                      child: Image.asset('assets/c.png')),
                ],
              ),
              color: bluish,
              width: double.infinity,
              height: 250,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          _taskController.Completed_task.length!=0?
          Expanded(
            child: Container(
              child:  Obx(() {
              return ListView.builder(
                itemCount: _taskController.Completed_task.length,
                itemBuilder: (_, index) {
                            return AnimationConfiguration.staggeredList(
                        position: index,
                        child: SlideAnimation(
                          child: FadeInAnimation(
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child:TaskTile(_taskController.Completed_task[index]),  
                                        
                               ),
                                
                              ],
                            ),
                          ),
                        ));
                
                  }
                
                
              );
            }),
            ),
          ):Container(child: Center(child: Column(
            children: [
              Container(
                width: 250,
                height: 250,
                child: Image.asset('assets/nodata.png'),
              ),
              Text("No Completed Task",style: TextStyle(fontSize: 20,color: Colors.black),)

            ],
          )),)
        ],
      ),
      // Obx(() {
      //          ListView.builder(
      //           itemCount: _taskController.Completed_task.length,

      //           itemBuilder: (_, index) {
      //               print(_taskController.Completed_task.length);
      //                       return AnimationConfiguration.staggeredList(
      //                   position: index,
      //                   child: SlideAnimation(
      //                     child: FadeInAnimation(
      //                       child: Row(
      //                         children: [
      //                           GestureDetector(
      //                             onTap: () {},
      //                             child:TaskTile(_taskController.Completed_task[index]),

      //                          ),

      //                         ],
      //                       ),
      //                     ),
      //                   ));
      //             }

      //         );
      //       }),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 70);
    var controllpoint = Offset(50, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controllpoint.dx, controllpoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
