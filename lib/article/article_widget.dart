import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/article.dart';

class ArticleWidget extends StatelessWidget {
  final Article _article;

  const ArticleWidget(this._article, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _background(context),
        _foreground(context),
      ],
    );
  }

  Widget _background(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: _article.imageUrl,
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height,
      fadeInDuration: Duration(milliseconds: 100),
      fadeOutDuration: Duration(milliseconds: 100),
    );
  }

  Widget _foreground(BuildContext context) {
    return Positioned(
      bottom: 100,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _article.publishTime,
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 10),
            Text(
              _article.title,
              maxLines: 3,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
