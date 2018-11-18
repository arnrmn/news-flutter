import 'package:flutter/material.dart';
import 'package:news_app/article.dart';
import 'package:news_app/network/news_api.dart';

class NewsList extends StatefulWidget {
  @override
  State createState() => NewsListState();
}

class NewsListState extends State<NewsList> {
  List<Article> _articles = List<Article>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[Text("Something")],
      ),
      onRefresh: fetchData,
    );
  }

  Widget _buildContent(
    BuildContext context,
    AsyncSnapshot<List<Article>> snapShot,
  ) {
    if (snapShot.hasData) {
      return _buildNewsList(_articles);
    } else if (snapShot.hasError) {
      return Text(snapShot.error.toString());
    } else {
      return CircularProgressIndicator();
    }
  }

  Widget _buildNewsList(List<Article> articles) {
    return RefreshIndicator(
      onRefresh: fetchData,
      child: ListView(
        children:
            articles.map<Widget>((article) => Text(article.title)).toList(),
      ),
    );
  }

  Future<void> fetchData() async {
    return await NewsApi.fetchArticles();
  }
}
