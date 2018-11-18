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
      builder: _buildContent,
      future: _articles,
    );
  }

  Widget _buildContent(
    BuildContext context,
    AsyncSnapshot<List<Article>> snapShot,
  ) {
    if (snapShot.hasData) {
      return _buildNewsList(snapShot.data);
    } else if (snapShot.hasError) {
      return Text(snapShot.error.toString());
    } else {
      return CircularProgressIndicator();
    }
  }

  Widget _buildNewsList(List<Article> articles) {
    return ListView(
      children: articles.map<Widget>((article) => Text(article.title)).toList(),
    );
  }
}
