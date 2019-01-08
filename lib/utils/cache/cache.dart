abstract class Cache<T> {
  void put(String key, T item);

  T get(String key);
}
