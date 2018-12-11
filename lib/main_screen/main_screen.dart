import 'package:flutter/material.dart';
import 'package:news_app/main_screen/news_drawer.dart';

class MainScreen extends StatefulWidget {
  @override
  State createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  int _selectedPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: _getBody(_selectedPosition),
      drawer: NewsDrawer(
        onSelected: _onNavigationItemSelected,
        items: _getNavigationItems(),
        selectedPosition: _selectedPosition,
      ),
    );
  }

  Widget _getBody(int position) {
    return Text("Selected position: $position");
  }

  List<NavigationItem> _getNavigationItems() {
    return [
      NavigationItem("Explore", Icons.explore),
      NavigationItem("Favorites", Icons.favorite)
    ];
  }

  void _onNavigationItemSelected(int position) {
    Navigator.pop(context);
    if (_selectedPosition != position) {
      setState(() {
        _selectedPosition = position;
      });
    }
  }
}
