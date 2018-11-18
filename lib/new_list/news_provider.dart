import 'package:news_app/article.dart';

abstract class NewsProvider {
  Stream<List<Article>> getArticles();
}

class BBCNewsProvider extends NewsProvider {
  static const _SOURCE = "bbc-news";

  @override
  Stream<List<Article>> getArticles() {
    return Stream.empty();
  }
}
