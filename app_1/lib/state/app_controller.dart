import 'package:rxdart/rxdart.dart';

class AppController {
  final BehaviorSubject<int> _currentPageIndex = BehaviorSubject.seeded(0);
  Stream<int> get currentPageIndexStream => _currentPageIndex.stream;
  int get currentPageIndex => _currentPageIndex.value;

  changePage(int index) {
    _currentPageIndex.add(index);
  }
}

AppController appController = AppController();
