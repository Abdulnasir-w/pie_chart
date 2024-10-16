// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_manager_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskManagerModelAdapter extends TypeAdapter<TaskManagerModel> {
  @override
  final int typeId = 1;

  @override
  TaskManagerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskManagerModel(
      title: fields[0] as String,
      description: fields[1] as String,
      isCompleted: fields[2] as bool,
      createdDate: fields[3] as DateTime,
      dueDate: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskManagerModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.isCompleted)
      ..writeByte(3)
      ..write(obj.createdDate)
      ..writeByte(4)
      ..write(obj.dueDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskManagerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
