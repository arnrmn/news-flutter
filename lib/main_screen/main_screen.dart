import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: _body(_selectedItem),
      drawer: _drawer(context),
    );
  }

  Widget _body(int position) {
    switch (position) {
      case 0:
        return Center(
          child: Text("Explore"),
        );
      default:
        return Center(
          child: Text("Favorite"),
        );
    }
  }

  Drawer _drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _exploreItem(context),
          _favoritesItem(context)
        ],
      ),
    );
  }

  ListTile _favoritesItem(BuildContext context) {
    return ListTile(
      title: Text("favorites"),
      leading: Icon(Icons.favorite),
      selected: _selectedItem == 1,
      onTap: () {
        setState(() {
          _selectedItem = 1;
        });
        Navigator.pop(context);
      },
    );
  }

  ListTile _exploreItem(BuildContext context) {
    return ListTile(
      title: Text("explore"),
      leading: Icon(Icons.explore),
      selected: _selectedItem == 0,
      onTap: () {
        setState(() {
          _selectedItem = 0;
        });
        Navigator.pop(context);
      },
    );
  }

  ListTile _drawerHeader() {
    return ListTile(
      title: AspectRatio(
        aspectRatio: 16 / 9,
        child: Image(image: AssetImage('assets/image_android.png')),
      ),
    );
  }
}
