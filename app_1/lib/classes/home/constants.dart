import 'package:app_1/classes/home/interfaces.dart';

class HomeConstants {
  static const List<IBottomAppBarItem> APP_TABS = [
    IBottomAppBarItem(
        activeIndex: 0, icon: 'assets/icons/house.svg', height: 20),
    IBottomAppBarItem(
      activeIndex: 1,
      icon: 'assets/icons/globe.svg',
    ),
    IBottomAppBarItem(
        activeIndex: 2, icon: 'assets/icons/location.svg', height: 23),
    IBottomAppBarItem(
        activeIndex: 3, icon: 'assets/icons/profile.svg', height: 21)
  ];
}
