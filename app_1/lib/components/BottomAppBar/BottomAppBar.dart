import 'package:app_1/components/BottomAppBar/BottomAppBarItem.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final void Function(int index) changePage;
  final int pageIndex;
  const BottomBar(
      {super.key, required this.changePage, required this.pageIndex});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.all(0),
      child: Container(
        color: Colors.white,
        height: 60,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BottomAppBarItem(
                  icon: 'assets/icons/house.svg',
                  active: widget.pageIndex == 0,
                  onClick: () {
                    widget.changePage(0);
                  },
                  height: 20,
                ),
                BottomAppBarItem(
                  icon: 'assets/icons/globe.svg',
                  active: widget.pageIndex == 1,
                  onClick: () {
                    widget.changePage(1);
                  },
                ),
                BottomAppBarItem(
                  icon: 'assets/icons/location.svg',
                  active: widget.pageIndex == 2,
                  onClick: () {
                    widget.changePage(2);
                  },
                  height: 23,
                ),
                BottomAppBarItem(
                  icon: 'assets/icons/profile.svg',
                  active: widget.pageIndex == 3,
                  onClick: () {
                    widget.changePage(3);
                  },
                  height: 21,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
