import 'package:news_app/article.dart';
import 'package:news_app/articles_list/articles_service.dart';
import 'package:news_app/articles_list/articles_storage.dart';
import 'package:news_app/sources_screen/source.dart';
import 'package:news_app/utils/cache.dart';

class ArticlesUseCase {
  final Cache<List<Article>> _storage;
  final ArticlesService _service;

  ArticlesUseCase({
    Cache<List<Article>> storage,
    ArticlesService service,
  })  : _storage = storage ?? ArticlesStorage(),
        _service = service ?? ArticlesService();

  Future<List<Article>> getArticles(Source source) async {
    final cachedArticle = _storage.get(source.id);
    if (cachedArticle == null) {
      return _service.getArticles(source, 1).then((articles) => _save(source.id, articles));
    } else {
      return cachedArticle;
    }
  }

  List<Article> _save(String key, List<Article> articles) {
    _storage.put(key, articles);
    return articles;
  }
}
