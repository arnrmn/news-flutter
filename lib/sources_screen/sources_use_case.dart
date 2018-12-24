import 'package:news_app/sources_screen/source.dart';
import 'package:news_app/sources_screen/sources_service.dart';
import 'package:news_app/sources_screen/sources_storage.dart';

class SourcesUseCase {
  final SourcesStorage _storage;
  final SourcesService _service;

  const SourcesUseCase({
    storage: const SourcesStorage(),
    service: const SourcesService(),
  })  : _service = service,
        _storage = storage;

  Future<List<Source>> getSources() {
    return _service.getSources();
  }
}
