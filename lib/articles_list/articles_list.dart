import 'package:flutter/material.dart';
import 'package:news_app/article.dart';
import 'package:news_app/articles_list/articles_usecase.dart';
import 'package:news_app/loading/loading_screen.dart';
import 'package:news_app/sources_screen/source.dart';

class ArticlesList extends StatelessWidget {
  final Source _source;
  final ArticlesUseCase _useCase;

  ArticlesList(source, {ArticlesUseCase useCase})
      : _source = source,
        _useCase = useCase ?? ArticlesUseCase();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: _useCase.getArticles(_source),
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
