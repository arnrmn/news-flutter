import 'package:news_app/article.dart';
import 'package:news_app/network/news_api.dart';
import 'package:news_app/sources_screen/source.dart';

class ArticlesService {
  Future<List<Article>> getArticles(Source source, int page) {
    return NewsApi.getArticles(source, page);
  }
}
