import 'package:flutter/material.dart';
import 'package:news_app/article.dart';
import 'package:news_app/network/news_api.dart';

class NewsList extends StatefulWidget {
  @override
  State createState() => NewsListState();
}

class NewsListState extends State<NewsList> {
  Future<List<Article>> _articles;

  @override
  void initState() {
    super.initState();
    _articles = NewsApi.fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      builder: _buildArticlesList,
      future: _articles,
    );
  }

  Widget _buildArticlesList(
      BuildContext context, AsyncSnapshot<List<Article>> snapShot) {
    if (snapShot.hasData) {
      return Text(snapShot.data.length.toString());
    } else if (snapShot.hasError) {
      return Text(snapShot.error.toString());
    }

    return CircularProgressIndicator();
  }
}
