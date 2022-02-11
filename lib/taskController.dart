
import 'package:get/state_manager.dart';
import 'package:to_do/DbHelper.dart';
import 'package:to_do/task.dart';

class taskController extends GetxController{
  static var tasklist=<task>[].obs;
  @override
  void onReady(){
    super.onReady();
  }
  Future<int?> addTask({task? Task})async{
    return await DbHelper.insert(Task);
  }
  void getTasks()async{
    List<Map<String,dynamic>> tasks=await DbHelper.query();
    tasklist.assignAll(tasks.map((data) => new task.fromjson(data)).toList());
  }
}