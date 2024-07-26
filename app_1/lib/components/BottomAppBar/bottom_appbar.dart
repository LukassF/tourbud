import 'package:app_1/classes/home/constants.dart';
import 'package:app_1/classes/home/utils.dart';
import 'package:app_1/components/BottomAppBar/bottom_appbar_item.dart';
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
      padding: const EdgeInsets.all(0),
      child: Container(
        color: Colors.white,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: HomeConstants.APP_TABS
                        .asMap()
                        .entries
                        .map((tab) => BottomAppBarItem(
                              active: widget.pageIndex == tab.value.activeIndex,
                              icon: tab.value.icon,
                              onClick: () {
                                widget.changePage(tab.value.activeIndex);
                              },
                              height: tab.value.height,
                              width: tab.value.width,
                            ))
                        .toList()),
              ),
              SizedBox(
                height: 10,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.decelerate,
                      left: HomeUtils.indicatorPosition(widget.pageIndex),
                      child: ClipOval(
                        child: Container(
                          height: 5,
                          width: 5,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
