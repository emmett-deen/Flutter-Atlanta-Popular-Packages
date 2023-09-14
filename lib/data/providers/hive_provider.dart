import 'package:hive/hive.dart';

class HiveProvider<T> {
  HiveProvider({required this.box});

  final Box<T> box;

  T put(String key, T val) {
    box.put(key, val);
    return val;
  }

  T get(String key) {
    return box.get(key) as T;
  }
}
