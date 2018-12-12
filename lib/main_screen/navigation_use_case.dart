import 'package:flutter/material.dart';
import 'package:news_app/main_screen/navigation_item.dart';

class NavigationUseCase {
  List<NavigationItem> _navigation = [
    NavigationItem("Explore", Icons.explore),
    NavigationItem("Favorite", Icons.favorite)
  ];

  Future<List<NavigationItem>> getNavigation() {
    return Future.value(_navigation);
  }
}
