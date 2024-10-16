import 'package:example/Hive/Model/task_manager_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskManager extends StatefulWidget {
  const TaskManager({super.key});

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  final taskBox = Hive.box<TaskManagerModel>("TaskManager");
  TextEditingController taskController = TextEditingController();
  TextEditingController desController = TextEditingController();
  DateTime? dueDate;
  int? editingIndex;

  void updateTask(int index) {
    var task = taskBox.getAt(index);
    if (task != null) {
      setState(() {
        taskController.text = task.title;
        desController.text = task.description;
        editingIndex = index;
      });
    }
  }

  void saveTask() {
    String title = taskController.text.trim();
    String description = desController.text.trim();

    if (title.isNotEmpty && description.isNotEmpty) {
      if (editingIndex != null) {
        // Update existing task
        var task = taskBox.getAt(editingIndex!);
        if (task != null) {
          task.title = title;
          task.description = description;
          taskBox.putAt(editingIndex!, task);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Task Updated Successfully")),
          );
        }
        editingIndex = null;
      } else {
        // Add new task
        var newTask = TaskManagerModel(
          title: title,
          description: description,
          createdDate: DateTime.now(),
          dueDate: dueDate,
        );
        taskBox.add(newTask);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("New Task Added")),
        );
      }
      taskController.clear();
      desController.clear();
      dueDate = null;
    }
  }

  // Delete
  void deleteTask(int index) {
    taskBox.deleteAt(index);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Successfully Deleted"),
      ),
    );
  }

  // Completion
  void markAsComplete(int index) {
    var task = taskBox.getAt(index);
    if (task != null) {
      setState(() {
        task.isCompleted = !task.isCompleted;
      });
      taskBox.putAt(index, task);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Task Manager",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: InputDecoration(
                labelText: "Task",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: desController,
              decoration: InputDecoration(
                labelText: "Description",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: saveTask,
              style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Colors.deepPurpleAccent),
              ),
              child: Text(
                editingIndex == null ? "Save" : "Update",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: taskBox.listenable(),
                builder: (context, Box<TaskManagerModel> box, _) {
                  if (box.values.isEmpty) {
                    return const Center(child: Text("No Data Available"));
                  }
                  return ListView.builder(
                    itemCount: box.values.length,
                    itemBuilder: (context, index) {
                      var task = box.getAt(index);
                      return ListTile(
                        title: Text(task!.title),
                        subtitle: Text(task.description),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                updateTask(index);
                              },
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                deleteTask(index);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                        onTap: () => markAsComplete(index),
                        leading: Icon(
                          task.isCompleted
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          color: task.isCompleted ? Colors.green : Colors.grey,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
