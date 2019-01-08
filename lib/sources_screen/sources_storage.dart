import 'package:news_app/sources_screen/source.dart';
import 'package:news_app/utils/cache/memory_cache.dart';

class SourcesStorage extends MemoryCache<List<Source>> {
  static final _singleton = SourcesStorage._internal();

  factory SourcesStorage() => _singleton;

  SourcesStorage._internal();
}
