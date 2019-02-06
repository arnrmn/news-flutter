import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/entity/article.dart';
import 'package:news_app/utils/formatter/date_time_formatter.dart';

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
    return Container(
      foregroundDecoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.black45,
            Colors.transparent,
            Colors.transparent,
            Colors.black54,
            Colors.black54,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: CachedNetworkImage(
        imageUrl: _article.imageUrl,
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height,
        fadeInDuration: const Duration(milliseconds: 100),
        fadeOutDuration: const Duration(milliseconds: 100),
      ),
    );
  }

  Widget _foreground(BuildContext context) {
    return Positioned(
      bottom: 32,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              DateFormatter.format(_article.publishTime),
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 10),
            Text(
              _article.title,
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
