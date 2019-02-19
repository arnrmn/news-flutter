import 'package:flutter/material.dart';
import 'package:news_app/entity/source.dart';
import 'package:news_app/ui/loading/loading_screen.dart';
import 'package:news_app/ui/source/source_screen.dart';
import 'package:news_app/ui/sources/sources_screen.dart';
import 'package:news_app/ui/widgets/backdrop.dart';
import 'package:news_app/use_case/source/sources_use_case.dart';

class HomeScreen extends StatelessWidget {
  final SourcesUseCase _sourcesUseCase;

  HomeScreen({Key key, SourcesUseCase useCase})
      : _sourcesUseCase = useCase ?? SourcesUseCase(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Source>>(
      future: _sourcesUseCase.getSources(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _showBackdrop(snapshot.data);
        } else if (snapshot.hasError) {
          return _showError(snapshot.error);
        } else {
          return _showProgress();
        }
      },
    );
  }

  Widget _showBackdrop(List<Source> sources) {
    return Backdrop(
      front: SourceScreen(source: sources.first),
      back: SourcesScreen(sources: sources),
    );
  }

  Widget _showError(error) {
    return Text(error.toString());
  }

  Widget _showProgress() {
    return LoadingScreen();
  }
}
