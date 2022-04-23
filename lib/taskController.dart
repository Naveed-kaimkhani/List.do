import 'package:get/state_manager.dart';
import 'package:to_do/DbHelper.dart';
import 'package:to_do/task.dart';

class taskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var tasklist = <task>[].obs;
  var Completed_task = <task>[].obs;
  var pending_task = <task>[].obs;

  Future<int?> addTask({task? Task}) async {
    pending_task.add(Task!);
    print("task length is " + tasklist.length.toString());
    return await DbHelper.insert(Task);
   
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DbHelper.query();
    tasklist.assignAll(tasks.map((data) => new task.fromjson(data)).toList());
  }

  void delete(task t) async {
    DbHelper.delete(t);
    getTasks();
  }

  void markedCompleted(int id,task taskk) async {
    await DbHelper.update(id);
  Completed_task.add(taskk);
  pending_task.remove(taskk);

    getTasks();
  }
}
