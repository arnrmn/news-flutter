import 'package:flutter/material.dart';
import 'package:news_app/articles_list/articles_list.dart';
import 'package:news_app/loading/loading_screen.dart';
import 'package:news_app/sources_screen/source.dart';
import 'package:news_app/sources_screen/sources_use_case.dart';

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
  final Source _selectedSource;

  _SourcesScreen(sources)
      : _sources = sources,
        _selectedSource = sources.first;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _sources.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (_, __) => [_getToolbar()],
          body: _getBody(),
        ),
      ),
    );
  }

  Widget _getBody() =>
      TabBarView(children: _sources.map((source) => ArticlesList(source)).toList());

  Widget _getToolbar() => SliverAppBar(
        flexibleSpace: FlexibleSpaceBar(background: FlutterLogo()),
        expandedHeight: 250,
        pinned: true,
        bottom: TabBar(
          isScrollable: true,
          labelColor: Colors.black87,
          tabs: _sources.map((source) => Tab(text: source.name)).toList(),
        ),
      );
}
