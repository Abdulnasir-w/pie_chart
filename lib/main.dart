import 'package:example/Hive/Model/person_model.dart';
import 'package:example/Hive/Model/task_manager_model.dart';
import 'package:example/Hive/task_manager.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PersonModelAdapter());
  Hive.registerAdapter(TaskManagerModelAdapter());
  await Hive.openBox<TaskManagerModel>("TaskManager");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskManager(),
    );
  }
}
