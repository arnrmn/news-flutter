import 'package:flutter/material.dart';
import 'package:news_app/entity/article.dart';
import 'package:news_app/entity/source.dart';
import 'package:news_app/ui/article/article_preview.dart';
import 'package:news_app/ui/loading/loading_screen.dart';
import 'package:news_app/use_case/article/articles_usecase.dart';
import 'package:page_indicator/page_indicator.dart';

class SourceScreen extends StatelessWidget {
  final Source _source;
  final ArticlesUseCase _useCase;

  SourceScreen(source, {ArticlesUseCase useCase})
      : _source = source,
        _useCase = useCase ?? ArticlesUseCase();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: _useCase.getArticles(_source),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildNewsList(snapshot.data);
        } else if (snapshot.hasError) {
          return Scaffold(body: Center(child: Text("Error: ${snapshot.error.toString()}")));
        } else {
          return LoadingScreen();
        }
      },
    );
  }

  Widget _buildNewsList(List<Article> articles) {
    List<Article> articlesWithImages =
        articles.where((article) => article.imageUrl != null).toList();
    PageController controller = PageController();
    return Stack(
      alignment: Alignment.center,
      children: [
        PageIndicatorContainer(
          length: articlesWithImages.length,
          indicatorColor: Colors.white30,
          indicatorSelectorColor: Colors.white,
          size: 6,
          pageView: PageView.builder(
            controller: controller,
            itemCount: articlesWithImages.length,
            itemBuilder: (context, index) {
              return ArticleWidget(articlesWithImages[index]);
            },
          ),
        ),
        Positioned(
          top: 40,
          child: Text(_source.name, style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
