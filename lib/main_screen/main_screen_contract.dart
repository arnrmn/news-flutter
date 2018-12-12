import 'package:news_app/main_screen/navigation_item.dart';

abstract class View {
  void setSelected(NavigationItem item);

  void setNavigation(List<NavigationItem> items);
}

abstract class Presenter {
  void onViewReady();

  void onNavigationItemSelected(NavigationItem item);
}
