import 'package:app_1/classes/home/interfaces.dart';
import 'package:app_1/state/home_controller.dart';

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

  static List<ICategoryCard> CATEGORIES = [
    ICategoryCard(label: 'Featured', onClick: homeController.setActiveCategory),
    ICategoryCard(label: 'Winter', onClick: homeController.setActiveCategory),
    ICategoryCard(label: 'Weekend', onClick: homeController.setActiveCategory),
    ICategoryCard(label: 'Relax', onClick: homeController.setActiveCategory),
    ICategoryCard(label: 'Italy', onClick: homeController.setActiveCategory),
    ICategoryCard(
        label: 'Adrenaline rush', onClick: homeController.setActiveCategory)
  ];
}
