import 'package:news_app/article.dart';
import 'package:news_app/articles_list/articles_service.dart';
import 'package:news_app/articles_list/articles_storage.dart';
import 'package:news_app/sources_screen/source.dart';
import 'package:news_app/utils/cache/cache.dart';

class ArticlesUseCase {
  final Cache<List<Article>> _storage;
  final ArticlesService _service;

  ArticlesUseCase({storage, service})
      : _storage = storage ?? ArticlesStorage(),
        _service = service ?? const ArticlesService();

  Future<List<Article>> getArticles(Source source) async {
    return _storage.get(source.id) ??
        _service.getArticles(source, 1).then((articles) => _save(source, articles));
  }

  List<Article> _save(Source source, List<Article> articles) {
    _storage.put(source.id, articles);
    return articles;
  }
}
