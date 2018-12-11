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
  String _error;
  bool _isLoading = false;

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
      _isLoading = false;
      _error = null;
      _navigation = items;
      _selectedItem = items.first;
    });
  }

  @override
  void setError(String error) {
    setState(() {
      _error = error;
      _isLoading = false;
    });
  }

  @override
  void setLoading() {
    setState(() {
      _isLoading = true;
      _error = null;
    });
  }

  Widget _getBody() {
    if (_error != null) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(_error)));
      return Center(
          child: MaterialButton(
        onPressed: _presenter.onRetryRequested,
        child: Icon(Icons.refresh),
      ));
    }

    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (_selectedItem != null) {
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
