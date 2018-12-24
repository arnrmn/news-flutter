import 'package:flutter/material.dart';
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
          return _LoadedSourcesScreen(snapshot.data);
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text("Error: ${snapshot.error.toString()}")),
          );
        } else {
          return LoadingScreen();
        }
      },
    );
  }
}

class _LoadedSourcesScreen extends StatelessWidget {
  final List<Source> _sources;

  _LoadedSourcesScreen(sources) : this._sources = sources;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _sources.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: _getHeaderBuilder,
          body: _getBody(),
        ),
      ),
    );
  }

  Widget _getBody() {
    return TabBarView(
        children: _sources
            .map((source) => Center(child: Text(source.name)))
            .toList());
  }

  List<Widget> _getHeaderBuilder(context, isScroller) {
    return [
      _getToolbar(),
      _getTabBarLayout(),
    ];
  }

  Widget _getTabBarLayout() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverTabBarDelegate(_getTabBar()),
    );
  }

  Widget _getTabBar() {
    return TabBar(
      isScrollable: true,
      labelColor: Colors.black87,
      tabs: _sources.map((source) => Tab(text: source.name)).toList(),
    );
  }

  Widget _getToolbar() {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: FlutterLogo(),
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverTabBarDelegate(this._tabBar);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return _tabBar;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;
}
