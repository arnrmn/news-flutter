import 'package:news_app/main_screen/navigation_item.dart';

abstract class View {
  void setSelected(NavigationItem item);

  void setNavigation(List<NavigationItem> items);

  void setError(String error);

  void setLoading();
}

abstract class Presenter {
  void onViewReady();

  void onNavigationItemSelected(NavigationItem item);

  void onRetryRequested();
}
