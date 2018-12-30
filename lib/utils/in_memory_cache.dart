import 'package:news_app/utils/cache.dart';

class InMemoryCache<T> implements Cache<T> {
  final Map _cache = Map();

  @override
  void put(String key, item) {
    _cache[key] = item;
  }

  @override
  T get(String key) {
    return _cache[key];
  }
}
