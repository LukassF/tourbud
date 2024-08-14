import 'package:app_1/classes/home/interfaces.dart';
import 'package:rxdart/rxdart.dart';

class HomeController {
  final BehaviorSubject<bool> _isSearchOpen = BehaviorSubject.seeded(false);
  Stream<bool> get isSearchOpenStream => _isSearchOpen.stream;
  bool get isSearchOpen => _isSearchOpen.value;
  toggleSearch(bool open) {
    _isSearchOpen.add(open);
  }

  final BehaviorSubject<double> _scrollDistance = BehaviorSubject.seeded(0);
  Stream<double> get scrollDistanceStream => _scrollDistance.stream;
  double get scrollDistance => _scrollDistance.value;
  setScrollDistance(double distance) {
    _scrollDistance.add(distance);
  }

  final BehaviorSubject<int> _activeCategory = BehaviorSubject.seeded(0);
  Stream<int> get activeCategoryStream => _activeCategory.stream;
  int get activeCategory => _activeCategory.value;
  setActiveCategory(int category) {
    _activeCategory.add(category);
  }

  final BehaviorSubject<IIndicatorLayout> _categoryIndicatorPosition =
      BehaviorSubject.seeded(IIndicatorLayout(left: 16, width: 95));
  Stream<IIndicatorLayout> get categoryIndicatorPosition =>
      _categoryIndicatorPosition.stream;
  updateCategoryIndicatorPosition(IIndicatorLayout layout) {
    _categoryIndicatorPosition.add(layout);
  }

  final BehaviorSubject<double> _categoryListScrollDistance =
      BehaviorSubject.seeded(0.0);
  Stream<double> get categoryListScrollDistance =>
      _categoryListScrollDistance.stream;
  updateCategoryListScrollDistance(double distance) {
    _categoryListScrollDistance.add(distance);
  }
}

HomeController homeController = HomeController();
