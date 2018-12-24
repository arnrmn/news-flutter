import 'package:flutter/material.dart';
import 'package:news_app/article.dart';
import 'package:news_app/loading/loading_screen.dart';
import 'package:news_app/network/news_api.dart';
import 'package:news_app/sources_screen/source.dart';

class NewsList extends StatelessWidget {
  final Source _source;

  const NewsList(source) : _source = source;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: NewsApi.getArticles(_source, 1),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildNewsList(snapshot.data);
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text("Error: ${snapshot.error.toString()}")),
          );
        } else {
          return LoadingScreen();
        }
      },
    );
  }

  Widget _buildNewsList(List<Article> articles) {
    return ListView.builder(
      itemBuilder: (context, index) => Text(articles[index].title),
      itemCount: articles.length,
    );
  }
}
