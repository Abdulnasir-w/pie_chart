import 'package:example/Hive/Model/task_manager_model.dart';
import 'package:hive/hive.dart';

class TaskManageServices {
  // Assuming you pass the box instance from the widget rather than reopening
  final Box<TaskManagerModel> taskBox;

  TaskManageServices(this.taskBox);

  // Add New
  Future<void> addNew(TaskManagerModel tskModel) async {
    await taskBox.add(tskModel);
  }

  // Retrieve All
  Future<List<TaskManagerModel>> readAll() async {
    return taskBox.values.toList();
  }

  // Update
  Future<void> update(int index, TaskManagerModel model) async {
    await taskBox.putAt(index, model);
  }

  // Delete
  Future<void> delete(int index) async {
    await taskBox.deleteAt(index);
  }
}
