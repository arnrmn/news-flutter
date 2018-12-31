import 'package:news_app/article.dart';
import 'package:news_app/network/article_mapper.dart';
import 'package:news_app/network/mapper.dart';
import 'package:news_app/network/news_api.dart';
import 'package:news_app/sources_screen/source.dart';

class ArticlesService {
  final NewsApi _api;
  final ResponseMapper _mapper;

  const ArticlesService({api, mapper})
      : _api = api ?? const NewsApi(),
        _mapper = mapper ?? const ArticlesMapper();

  Future<List<Article>> getArticles(Source source, int page) {
    return _api.getArticles(source, page).then(_mapper.map);
  }
}
