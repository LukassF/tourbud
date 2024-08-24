import 'package:rxdart/rxdart.dart';

class AppController {
  final BehaviorSubject<int> _currentPageIndex = BehaviorSubject.seeded(0);
  Stream<int> get currentPageIndexStream => _currentPageIndex.stream;
  int get currentPageIndex => _currentPageIndex.value;
  changePage(int index) {
    _currentPageIndex.add(index);
  }

  final BehaviorSubject<double> _tabIndicatorPosition =
      BehaviorSubject.seeded(0);
  Stream<double> get tabIndicatorPositionStream => _tabIndicatorPosition.stream;
  double get tabIndicatorPosition => _tabIndicatorPosition.value;
  updateTabIndicatorPosition(double index) {
    _tabIndicatorPosition.add(index);
  }
}

AppController appController = AppController();
