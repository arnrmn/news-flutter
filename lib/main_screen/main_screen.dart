import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: Center(child: Text("Place holder")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Drawer Header"),
            ),
            ListTile(
              title: Text("explore"),
              onTap: () {},
            ),
            ListTile(
              title: Text("favourites"),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
