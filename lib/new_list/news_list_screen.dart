import 'package:flutter/material.dart';
import 'package:news_app/new_list/news_list_widget.dart';

class NewsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: Center(child: NewsList()),
    );
  }
}
