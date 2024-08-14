class IBottomAppBarItem {
  final String icon;
  final int activeIndex;
  final double? width;
  final double? height;

  const IBottomAppBarItem(
      {required this.activeIndex, required this.icon, this.height, this.width});
}

class IIndicatorLayout {
  final double left;
  final double width;

  const IIndicatorLayout({required this.left, required this.width});
}
