import 'package:news_app/article.dart';
import 'package:news_app/articles_list/articles_service.dart';
import 'package:news_app/articles_list/articles_storage.dart';

class ArticlesUseCase {
  final ArticlesStorage _storage;
  final ArticlesService _service;

  ArticlesUseCase({storage, service})
      : _storage = storage ?? ArticlesStorage(),
        _service = service ?? ArticlesService();

  Stream<List<Article>> getArticles(source) {
    return _storage.getArticles(source)
        .asStream()
        .handleError((error) {
      _service.getArticles(source, 1).asStream().forEach((articles) {
        _storage.saveArticles(source, articles);
      });
    });
  }
}
