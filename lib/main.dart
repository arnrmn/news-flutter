import 'package:flutter/material.dart';
import 'package:news_app/ui/home/home.dart';

void main() => runApp(NewsApplication());

class NewsApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomeScreen(),
    );
  }
}
