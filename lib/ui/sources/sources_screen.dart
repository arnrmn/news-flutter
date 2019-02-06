import 'package:flutter/material.dart';
import 'package:news_app/entity/source.dart';
import 'package:news_app/ui/loading/loading_screen.dart';
import 'package:news_app/ui/source/source_screen.dart';
import 'package:news_app/use_case/source/sources_use_case.dart';

class SourcesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Source>>(
      future: SourcesUseCase().getSources(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _SourcesScreen(snapshot.data);
        } else if (snapshot.hasError) {
          return Scaffold(body: Center(child: Text("Error: ${snapshot.error.toString()}")));
        } else {
          return LoadingScreen();
        }
      },
    );
  }
}

class _SourcesScreen extends StatelessWidget {
  final List<Source> _sources;

  _SourcesScreen(sources) : _sources = sources;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SourceScreen(_sources.first));
  }
}
