import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/entity/article.dart';
import 'package:news_app/network/mapper/mapper.dart';

class ArticlesMapper implements ResponseMapper<List<Article>> {
  const ArticlesMapper();

  @override
  List<Article> map(http.Response response) {
    return json.decode(response.body)['articles'].map<Article>((json) => _toArticle(json)).toList();
  }

  Article _toArticle(Map<String, dynamic> json) {
    return Article(
        title: json['title'],
        description: json['description'],
        imageUrl: json['urlToImage'],
        content: json['content'],
        publishTime: json['publishedAt'],
        url: json['url']);
  }
}
