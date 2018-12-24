import 'package:news_app/network/news_api.dart';
import 'package:news_app/sources_screen/source.dart';

class SourcesService {
  const SourcesService();

  Future<List<Source>> getSources() {
    return NewsApi.getSources();
  }
}