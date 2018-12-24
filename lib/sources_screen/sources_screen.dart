import 'package:flutter/material.dart';
import 'package:news_app/sources_screen/source.dart';
import 'package:news_app/sources_screen/sources_use_case.dart';

class SourcesScreen extends StatefulWidget {
  @override
  State createState() => _SourcesScreenState();
}

class _SourcesScreenState extends State<SourcesScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Source> _sources = [];
  final SourcesUseCase _useCase = SourcesUseCase();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 0, vsync: this);
    _useCase.getSources().then((sources) {
      setState(() {
        _sources = sources;
        _tabController = TabController(length: _sources.length, vsync: this);
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: _getHeaderBuilder,
        body: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return TabBarView(
        controller: _tabController,
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
      controller: _tabController,
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
