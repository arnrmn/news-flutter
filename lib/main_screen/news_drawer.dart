import 'package:flutter/material.dart';
import 'package:news_app/main_screen/navigation_item.dart';

class NewsDrawer extends StatelessWidget {
  final Function(NavigationItem) _onSelected;
  final List<NavigationItem> _items;
  final int _selectedPosition;

  NewsDrawer({onSelected, items, selectedItem})
      : _onSelected = onSelected,
        _items = items,
        _selectedPosition = items.indexOf(selectedItem);

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
        title: Text(item.title),
        leading: Icon(item.icon),
        selected: _selectedPosition == position,
        onTap: () {
          _onSelected(item);
        });
  }
}
