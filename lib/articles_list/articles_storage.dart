import 'package:news_app/article.dart';
import 'package:news_app/sources_screen/source.dart';

class ArticlesStorage {
  Map<String, List<Article>> _cache = Map();

  Future<List<Article>> getArticles(Source source) {
    if (_cache.containsKey(source.id)) {
      return Future.value(_cache[source.id]);
    } else {
      return Future.error("No data");
    }
  }

  Future<void> saveArticles(Source source, List<Article> articles) {
    return Future.value(_cache[source.id] = articles);
  }
}
