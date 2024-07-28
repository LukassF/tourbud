import 'package:rxdart/rxdart.dart';

class HomeController {
  BehaviorSubject<bool> _isSearchOpen = BehaviorSubject.seeded(false);
  Stream<bool> get isSearchOpenStream => _isSearchOpen.stream;
  bool get isSearchOpen => _isSearchOpen.value;
  toggleSearch(bool open) {
    _isSearchOpen.add(open);
  }

  int _scrollCounter = 0;
  BehaviorSubject<double> _scrollDistance = BehaviorSubject.seeded(0);
  Stream<double> get scrollDistanceStream => _scrollDistance.stream;
  double get scrollDistance => _scrollDistance.value;
  setScrollDistance(double distance) {
    _scrollDistance.add(distance);
  }
}

HomeController homeController = HomeController();
