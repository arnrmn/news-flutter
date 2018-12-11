import 'package:news_app/main_screen/main_screen_contract.dart';
import 'package:news_app/main_screen/navigation_item.dart';
import 'package:news_app/main_screen/navigation_use_case.dart';

class MainPresenter extends Presenter {
  final View _view;
  final NavigationUseCase _useCase;

  MainPresenter(view, useCase)
      : _view = view,
        _useCase = useCase;

  @override
  void onViewReady() {
    _getNavigation();
  }

  @override
  void onNavigationItemSelected(NavigationItem item) {
    _view.setSelected(item);
  }

  void _getNavigation() {
    _view.setLoading();
    _useCase
        .getNavigation()
        .then(_view.setNavigation)
        .catchError(_view.setError);
  }

  @override
  void onRetryRequested() {
    _getNavigation();
  }
}
