import 'package:flutter/material.dart';
import 'package:news_app/main_screen/main_presenter.dart';
import 'package:news_app/main_screen/main_screen_contract.dart';
import 'package:news_app/main_screen/navigation_item.dart';
import 'package:news_app/main_screen/navigation_use_case.dart';
import 'package:news_app/main_screen/news_drawer.dart';

class MainScreen extends StatefulWidget {
  @override
  State createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> implements View {
  Presenter _presenter;
  List<NavigationItem> _navigation;
  NavigationItem _selectedItem;

  MainScreenState() {
    _presenter = MainPresenter(this, NavigationUseCase());
  }

  @override
  void initState() {
    _presenter.onViewReady();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
      drawer: _getDrawer(),
    );
  }

  @override
  void setSelected(NavigationItem item) {
    if (_selectedItem != item) {
      setState(() {
        _selectedItem = item;
      });
    }
    Navigator.pop(context);
  }

  @override
  void setNavigation(List<NavigationItem> items) {
    setState(() {
      _navigation = items;
      _selectedItem = items.first;
    });
  }

  Widget _getBody() {
    if (_selectedItem != null) {
      return Center(child: Text(_selectedItem.title));
    } else {
      return null;
    }
  }

  Widget _getDrawer() {
    if (_navigation == null) {
      return null;
    } else {
      return NewsDrawer(
          onSelected: _presenter.onNavigationItemSelected,
          selectedItem: _selectedItem,
          items: _navigation);
    }
  }

  Widget _getAppBar() {
    if (_selectedItem == null) {
      return null;
    } else {
      return AppBar(title: Text(_selectedItem.title));
    }
  }
}
