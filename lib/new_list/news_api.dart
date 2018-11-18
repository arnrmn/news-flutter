import 'package:http/http.dart' as http;
import 'package:news_app/article.dart';
import 'dart:convert';

class NewsApi {
  static const _BASE_URL = "https://newsapi.org/v2/top-headlines?"
      "sources=bbc-news&apiKey=57a79eac5a8f44efa2bd3408139b83f3";

  Future<List<Article>> fetchArticles() async {
    final response = await http.get(_BASE_URL);

    if (response.statusCode == 200) {
      return json
          .decode(response.body)['articles']
          .map<Article>((json) => Article.fromJson(json))
          .toList();
    } else {
      throw Exception("Network error: ${response.statusCode.toString()}");
    }
  }
}
