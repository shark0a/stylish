import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  Future<void> init() async {
    await Hive.initFlutter();
  }

  Future<Box<T>> openBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    } else {
      return await Hive.openBox<T>(boxName);
    }
  }

  Box<T> getBox<T>(String boxName) {
    return Hive.box<T>(boxName);
  }

  Future<void> putData<T>(String boxName, dynamic key, T value) async {
    final box = getBox<T>(boxName);
    await box.put(key, value);
  }

  T? getData<T>(String boxName, dynamic key) {
    final box = getBox<T>(boxName);
    return box.get(key);
  }

  List<T> getAllData<T>(String boxName) {
    final box = getBox<T>(boxName);
    return box.values.cast<T>().toList();
  }

  Future<void> deleteData<T>(String boxName, dynamic key) async {
    final box = getBox<T>(boxName);
    await box.delete(key);
  }

  Future<void> clearBox<T>(String boxName) async {
    final box = getBox<T>(boxName);
    await box.clear();
  }
}
