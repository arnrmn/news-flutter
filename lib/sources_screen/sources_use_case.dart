import 'package:news_app/sources_screen/source.dart';
import 'package:news_app/sources_screen/sources_service.dart';
import 'package:news_app/sources_screen/sources_storage.dart';

class SourcesUseCase {
  final SourcesStorage _storage;
  final SourcesService _service;

  SourcesUseCase(this._storage, this._service);

  Future<List<Source>> getSources() {

  }
}
