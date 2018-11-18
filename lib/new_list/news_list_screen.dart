import 'package:flutter/material.dart';

class NewsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: Center(
        child: Text("This will be a news list"),
      ),
    );
  }
}
