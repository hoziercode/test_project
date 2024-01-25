import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class MyHiveBox {
  static const String _myBoxName = 'myBox';
  static Box? _box;

  // Method to open the Hive box if not already open and return the box instance
  static Future<Box> openBox() async {
    if (_box == null || !_box!.isOpen) {
      _box = await Hive.openBox(_myBoxName);
    }
    return _box!;
  }

  // Method to close the Hive box
  static Future<void> closeBox() async {
    if (_box != null && _box!.isOpen) {
      await _box!.close();
      _box = null;
    }
  }

  // Method to save a string to Hive
  static Future<void> saveString(String key, String value) async {
    final box = await openBox();
    await box.put(key, value);
  }

  // Method to retrieve a string from Hive
  static Future<String?> getString(String key) async {
    final box = await openBox();
    return box.get(key);
  }

  // Method to save a double to Hive
  static Future<void> saveDouble(String key, double value) async {
    final box = await openBox();
    await box.put(key, value);
  }

  // Method to retrieve a double from Hive
  static Future<double?> getDouble(String key) async {
    final box = await openBox();
    return box.get(key);
  }

  // Method to save a bool to Hive
  static Future<void> saveBool(String key, bool value) async {
    final box = await openBox();
    await box.put(key, value);
  }

  // Method to retrieve a bool from Hive
  static Future<bool?> getBool(String key) async {
    final box = await openBox();
    return box.get(key);
  }

  // Method to save an object to Hive
  static Future<void> saveObject<T>(String key, T value) async {
    final box = await openBox();
    await box.put(key, value);
  }

  // Method to retrieve an object from Hive
  static Future<T?> getObject<T>(String key) async {
    final box = await openBox();
    return box.get(key);
  }

  // Method to delete a key from Hive
  static Future<void> deleteKey(String key) async {
    final box = await openBox();
    await box.delete(key);
  }

  // Count items stored on CART key
  static Future<int> countItems() async {
    final box = await openBox();
    final List<dynamic>? result = box.get('CART');
    if (kDebugMode) {
      print('result: $result');
    }
    return result?.length ?? 0;
  }
}
