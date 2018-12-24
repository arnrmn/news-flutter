import 'package:http/http.dart' as http;
import 'package:news_app/article.dart';
import 'package:news_app/network/article_mapper.dart';
import 'package:news_app/network/sources_mapper.dart';
import 'package:news_app/sources_screen/source.dart';

class NewsApi {
  static const _KEY = "57a79eac5a8f44efa2bd3408139b83f3";
  static const _BASE_URL = "https://newsapi.org/v2";

  const NewsApi();

  static Future<List<Article>> getArticles(Source source, int page) async {
    final url =
        "$_BASE_URL/everything?sources=${source.id}&apiKey=$_KEY&page=$page";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ArticleMapper.map(response);
    } else {
      throw Exception("Network error: ${response.statusCode.toString()}");
    }
  }

  static Future<List<Source>> getSources() async {
    final url = "$_BASE_URL/sources?apiKey=$_KEY";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return SourcesMapper.map(response);
    } else {
      throw Exception("Network error: ${response.statusCode.toString()}");
    }
  }
}
