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
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: _getHeader,
          body: Text("BODY"),
        ),
      ),
    );
  }

  List<Widget> _getHeader(context, isScrolled) {
    return [
      SliverAppBar(
        expandedHeight: 200,
        pinned: true,
        floating: false,
        automaticallyImplyLeading: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text("Title"),
        ),
      ),
      SliverPersistentHeader(
        pinned: true,
        delegate: _SliverAppBarDelegate(
          TabBar(
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.info), text: "Tab 1"),
              Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 2"),
            ],
          ),
        ),
      )
    ];
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
