import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/sources_screen/source.dart';

class SourcesMapper {
  _SourcesMapper() {}

  static List<Source> map(Response response) {
    return json
        .decode(response.body)['sources']
        .map<Source>((json) => _toSource(json))
        .toList();
  }

  static Source _toSource(Map<String, dynamic> json) {
    return Source(
        id: json['id'],
        description: json['description'],
        url: json['url'],
        name: json['name'],
        category: json['category'],
        language: json['language'],
        country: json['country']);
  }
}
