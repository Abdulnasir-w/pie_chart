import 'package:hive_flutter/hive_flutter.dart';
part 'person_model.g.dart';

@HiveType(typeId: 0)
class PersonModel {
  @HiveField(0) //uinque id for each field
  int id;
  @HiveField(1)
  String name;
  PersonModel({
    required this.name,
    required this.id,
  });
}
