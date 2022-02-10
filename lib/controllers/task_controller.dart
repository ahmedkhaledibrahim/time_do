import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:time_do/db/db_helper.dart';
import 'package:time_do/models/task.dart';

class TaskController extends GetxController {
  final RxList taskList = <Task>[].obs;

  Future<void> getTask()async{
   final List<Map<String, dynamic>> tasks = await DBHelper().queryAllRows();
   taskList.assignAll(tasks.map((data) => Task.fromMap(data)).toList());
  }

  addTask(Task task)async{
    await DBHelper().insertTask(task);
    taskList.add(task);
    getTask();
  }

  deleteTask(int? id)async{
    await DBHelper().delete(id!);
    getTask();
  }

  deleteAllTasks()async{
    await DBHelper().deleteAllTasks();
    getTask();
  }

  markAsCompleted(int? id)async{
    await DBHelper().update(id!);
    getTask();
  }


}
