import 'package:news_app/sources_screen/source.dart';
import 'package:news_app/sources_screen/sources_service.dart';
import 'package:news_app/sources_screen/sources_storage.dart';
import 'package:news_app/utils/cache/cache.dart';

class SourcesUseCase {
  static final _key = "sources";
  final Cache<List<Source>> _storage;
  final SourcesService _service;

  SourcesUseCase({storage, service})
      : _service = service ?? const SourcesService(),
        _storage = storage ?? SourcesStorage();

  Future<List<Source>> getSources() async {
    return _storage.get(_key) ?? _service.getSources().then(_save);
  }

  List<Source> _save(List<Source> sources) {
    _storage.put(_key, sources);
    return sources;
  }
}
