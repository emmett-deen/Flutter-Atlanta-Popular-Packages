import 'package:flutter_atlanta_packages_example/data/providers/hive_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteRepository {
  late final HiveProvider<bool?> hiveProvider;

  Future<void> init() async {
    await Hive.initFlutter();
    final box = await Hive.openBox<bool>('favorites');
    hiveProvider = HiveProvider(box: box);
  }

  bool isFavorite(String id) {
    
    return hiveProvider.get(id) ?? false;
  }

  bool toggleFavorite(String id) {
    var isFavorite = hiveProvider.get(id) ?? false;
    isFavorite = !isFavorite;
    return hiveProvider.put(id, isFavorite) ?? isFavorite;
  }
}
