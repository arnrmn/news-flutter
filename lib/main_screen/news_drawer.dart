import 'package:flutter/material.dart';

class NewsDrawer extends StatelessWidget {
  final Function(int) _onSelected;
  final List<NavigationItem> _items;
  final int _selectedPosition;

  NewsDrawer({onSelected, items, selectedPosition})
      : _onSelected = onSelected,
        _items = items,
        _selectedPosition = selectedPosition;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: _buildItems(),
      ),
    );
  }

  List<Widget> _buildItems() {
    List<Widget> navigation = [];
    navigation.add(_drawerHeader());
    for (var i = 0; i < _items.length; i++) {
      navigation.add(_buildItem(i));
    }
    return navigation;
  }

  ListTile _drawerHeader() {
    return ListTile(
      title: AspectRatio(
        aspectRatio: 16 / 9,
        child: Image(image: AssetImage('assets/image_android.png')),
      ),
    );
  }

  Widget _buildItem(int position) {
    NavigationItem item = _items[position];
    return ListTile(
        title: Text(item.name),
        leading: Icon(item.icon),
        selected: _selectedPosition == position,
        onTap: () {
          _onSelected(position);
        });
  }
}

class NavigationItem {
  final String name;
  final IconData icon;

  NavigationItem(this.name, this.icon);
}
