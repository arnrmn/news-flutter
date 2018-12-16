import 'package:flutter/material.dart';
import 'package:news_app/main_screen/navigation_item.dart';
import 'package:news_app/main_screen/news_drawer.dart';
import 'package:news_app/sources_screen/sources_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<NavigationItem> _navigation;
  NavigationItem _selectedItem;

  _MainScreenState() {
    _navigation = [NavigationItem.EXPLORE, NavigationItem.FAVORITE];
    _selectedItem = _navigation.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
      drawer: _getDrawer(),
    );
  }

  Widget _getBody() {
    if (_selectedItem == NavigationItem.EXPLORE) {
      return SourcesScreen();
    } else {
      return Center(child: Text(_selectedItem.title));
    }
  }

  Widget _getDrawer() {
    return NewsDrawer(
        onSelected: _onNavigationItemSelected,
        selectedItem: _selectedItem,
        items: _navigation);
  }

  Widget _getAppBar() {
    return AppBar(title: Text(_selectedItem.title));
  }

  void _onNavigationItemSelected(NavigationItem item) {
    if (_selectedItem != item) {
      setState(() {
        _selectedItem = item;
      });
    }
    Navigator.pop(context);
  }
}
