
import 'package:get/state_manager.dart';
import 'package:to_do/DbHelper.dart';
import 'package:to_do/task.dart';

class taskController extends GetxController{
  @override
  void onReady(){
    super.onReady();
  }
     var tasklist=<task>[].obs;

  Future<int?> addTask({task? Task})async{
    print("task length is "+tasklist.length.toString());
    return await DbHelper.insert(Task);
  }
  void getTasks()async{
    List<Map<String,dynamic>> tasks=await DbHelper.query();
    tasklist.assignAll(tasks.map((data) => new task.fromjson(data)).toList());
  }
}