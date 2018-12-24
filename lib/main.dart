import 'package:flutter/material.dart';
import 'package:news_app/loading/loading_screen.dart';
import 'package:news_app/main_screen/main_screen.dart';
import 'package:news_app/sources_screen/sources_screen.dart';

void main() => runApp(NewsApplication());

class NewsApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: SourcesScreen(),
    );
  }
}
