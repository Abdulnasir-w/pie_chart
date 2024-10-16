import 'package:hive_flutter/hive_flutter.dart';
part 'task_manager_model.g.dart';

@HiveType(typeId: 1)
class TaskManagerModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  bool isCompleted;
  @HiveField(3)
  final DateTime createdDate;
  @HiveField(4)
  final DateTime? dueDate;

  TaskManagerModel({
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.createdDate,
    this.dueDate,
  });
}
