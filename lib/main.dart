import 'package:flutter/material.dart';
import 'package:news_app/new_list/news_list_screen.dart';

void main() => runApp(NewsApplication());

class NewsApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NewsListScreen(),
    );
  }
}
