import 'package:rxdart/rxdart.dart';

class AppController {
  final BehaviorSubject<double> _statusBarHeight = BehaviorSubject.seeded(0.0);
  Stream<double> get statusBarHeightStream => _statusBarHeight.stream;
  setStatusBarHeight(double val) {
    _statusBarHeight.add(val);
  }

  final BehaviorSubject<int> _currentPageIndex = BehaviorSubject.seeded(0);
  Stream<int> get currentPageIndexStream => _currentPageIndex.stream;
  int get currentPageIndex => _currentPageIndex.value;
  changePage(int index) {
    _currentPageIndex.add(index);
  }

  final BehaviorSubject<double> _tabIndicatorPosition =
      BehaviorSubject.seeded(60.2);
  Stream<double> get tabIndicatorPositionStream => _tabIndicatorPosition.stream;
  double get tabIndicatorPosition => _tabIndicatorPosition.value;
  updateTabIndicatorPosition(double position) {
    _tabIndicatorPosition.add(position);
  }
}

AppController appController = AppController();
