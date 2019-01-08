import 'package:news_app/utils/cache/cache.dart';

class MemoryCache<T> implements Cache<T> {
  final Map<String, T> _cache = Map();

  @override
  T get(String key) {
    return _cache[key];
  }

  @override
  void put(String key, T item) {
    _cache[key] = item;
  }
}
