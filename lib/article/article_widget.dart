import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/article.dart';

class ArticleWidget extends StatelessWidget {
  final Article _article;

  const ArticleWidget(this._article, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.transparent, Colors.white],
        ),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: CachedNetworkImageProvider(_article.imageUrl),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black87, BlendMode.color)),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          color: Colors.white.withOpacity(0.0),
        ),
      ),
    );
  }
}
