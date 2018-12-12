import 'package:flutter/material.dart';

class NavigationItem {
  final String title;
  final IconData icon;

  const NavigationItem(this.title, this.icon);

  static const NavigationItem EXPLORE =
      NavigationItem("Explore", Icons.explore);
  static const NavigationItem FAVORITE =
      NavigationItem("Favorites", Icons.favorite);
}
