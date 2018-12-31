import 'package:news_app/article.dart';
import 'package:news_app/utils/cache/memory_cache.dart';

class ArticlesStorage extends MemoryCache<List<Article>> {
  static final _singleton = ArticlesStorage._internal();

  factory ArticlesStorage() => _singleton;

  ArticlesStorage._internal();
}
