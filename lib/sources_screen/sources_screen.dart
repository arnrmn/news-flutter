import 'package:flutter/material.dart';

class SourcesScreen extends StatefulWidget {
  @override
  State createState() => _SourcesScreenState();
}

class _SourcesScreenState extends State<SourcesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 99,
        child: NestedScrollView(
          headerSliverBuilder: _getHeaderBuilder,
          body: _getBody(),
        ),
      ),
    );
  }

  Widget _getBody() {
    return Center(child: Text("Body"));
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
      labelColor: Colors.black87,
      tabs: [
        Tab(
          text: "Tab One",
          icon: Icon(Icons.attachment),
        ),
        Tab(
          text: "Tab Two",
          icon: Icon(Icons.add_alarm),
        )
      ],
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
