import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/entity/source.dart';
import 'package:news_app/network/mapper/mapper.dart';

class SourcesMapper implements ResponseMapper<List<Source>> {
  const SourcesMapper();

  @override
  List<Source> map(Response response) {
    return json.decode(response.body)['sources'].map<Source>((json) => _toSource(json)).toList();
  }

  Source _toSource(Map<String, dynamic> json) {
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
