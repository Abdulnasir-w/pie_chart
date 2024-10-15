import 'package:example/Hive/Model/person_model.dart';
import 'package:hive/hive.dart';

class HiveServices {
  final String boxName = "dumyBox";
  Future<Box<PersonModel>> get _box async =>
      await Hive.openBox<PersonModel>(boxName);

  /// Create User
  Future<void> addNew(PersonModel person) async {
    var box = await _box;
    await box.add(person);
  }

  /// Read
  Future<List<PersonModel>> getAll() async {
    var box = await _box;
    return box.values.toList();
  }

  /// Update
  Future<void> update(int index, PersonModel person) async {
    var box = await _box;
    await box.putAt(index, person);
  }

  /// Delete
  Future<void> delete(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }
}
