import 'package:news_app/article.dart';
import 'package:news_app/utils/in_memory_cache.dart';

class ArticlesStorage extends InMemoryCache<List<Article>> {
  static final _singleton = ArticlesStorage._internal();

  ArticlesStorage._internal();

  factory ArticlesStorage() => _singleton;

}
