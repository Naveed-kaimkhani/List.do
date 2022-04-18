import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:to_do/task.dart';
import 'package:to_do/TaskTile.dart';
import 'package:to_do/taskController.dart';

class Pending_task extends StatefulWidget {
  Pending_task({ Key? key }) : super(key: key);

  @override
  State<Pending_task> createState() => _Pending_taskState();
}

class _Pending_taskState extends State<Pending_task> {
  var _taskController = Get.put(taskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Expanded(child: Obx(() {
            return ListView.builder(
              itemCount: _taskController.tasklist.length,
              itemBuilder: (_, index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                        child: FadeInAnimation(
                          child: Row(
                            children: [
                              // GestureDetector(
                              //   onTap: () {},
                              //   child:if(_taskController.tasklist[index].isCompleted==0) {
                              //      TaskTile(_taskController.tasklist[index]);
                              //   }
                              //       // } else {
                                    //   Image.asset('assets/no.png');
                                    //  }  
                                    //   }
                             // )
                              
                            ],
                          ),
                        ),
                      ));
                }
              
              
            );
          })),
    );
  }
}