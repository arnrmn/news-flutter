import 'package:flutter/material.dart';
import 'package:news_app/entity/source.dart';

class SourcesScreen extends StatelessWidget {
  final List<Source> _sources;

  const SourcesScreen({@required sources, Key key})
      : _sources = sources ?? const [],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(_sources.length.toString());
  }
}
