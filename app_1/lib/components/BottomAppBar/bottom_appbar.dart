import 'package:app_1/classes/home/constants.dart';
import 'package:app_1/classes/home/utils.dart';
import 'package:app_1/components/BottomAppBar/bottom_appbar_item.dart';
import 'package:app_1/state/app_controller.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

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
          child: StreamBuilder<int>(
              stream: appController.currentPageIndexStream,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: HomeConstants.APP_TABS
                              .asMap()
                              .entries
                              .map((tab) => BottomAppBarItem(
                                    active:
                                        snapshot.data == tab.value.activeIndex,
                                    icon: tab.value.icon,
                                    onClick: () {
                                      appController
                                          .changePage(tab.value.activeIndex);
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
                            left: HomeUtils.indicatorPosition(snapshot.data),
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
                );
              }),
        ),
      ),
    );
  }
}
