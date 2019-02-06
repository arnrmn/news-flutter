import 'package:news_app/entity/source.dart';
import 'package:news_app/network/mapper/mapper.dart';
import 'package:news_app/network/mapper/sources_mapper.dart';
import 'package:news_app/network/news_api.dart';

class SourcesService {
  final NewsApi _api;
  final ResponseMapper<List<Source>> _mapper;

  const SourcesService({api, mapper})
      : _api = api ?? const NewsApi(),
        _mapper = mapper ?? const SourcesMapper();

  Future<List<Source>> getSources() {
    return _api.getSources().then(_mapper.map);
  }
}