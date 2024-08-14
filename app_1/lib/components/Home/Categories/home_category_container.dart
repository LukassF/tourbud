import 'package:app_1/classes/home/interfaces.dart';
import 'package:app_1/components/Home/Categories/home_category_card.dart';
import 'package:app_1/state/home_controller.dart';
import 'package:flutter/material.dart';

class HomeCategoryContainer extends StatefulWidget {
  const HomeCategoryContainer({super.key});

  @override
  State<HomeCategoryContainer> createState() => _HomeCategoryContainerState();
}

class _HomeCategoryContainerState extends State<HomeCategoryContainer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: homeController.activeCategoryStream,
        builder: (context, snapshot) {
          return Container(
            height: 60,
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                homeController.updateCategoryListScrollDistance(
                    scrollNotification.metrics.pixels);
                return false;
              },
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                Stack(
                  children: [
                    Row(
                      children: [
                        HomeCategoryCard(
                          isActive: snapshot.data == 0,
                          text: 'Featured',
                          isFirst: true,
                          index: 0,
                          onClick: homeController.setActiveCategory,
                        ),
                        HomeCategoryCard(
                            isActive: snapshot.data == 1,
                            text: 'Nearby hikes',
                            index: 1,
                            onClick: homeController.setActiveCategory),
                        HomeCategoryCard(
                            isActive: snapshot.data == 2,
                            text: 'Adrenaline rush',
                            index: 2,
                            onClick: homeController.setActiveCategory),
                        HomeCategoryCard(
                            isActive: snapshot.data == 3,
                            text: 'Leisure',
                            isLast: true,
                            index: 3,
                            onClick: homeController.setActiveCategory)
                      ],
                    ),
                    StreamBuilder<IIndicatorLayout>(
                        stream: homeController.categoryIndicatorPosition,
                        builder: (context, indicatorSnapshot) {
                          return AnimatedPositioned(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.decelerate,
                              bottom: 4,
                              left: indicatorSnapshot.data?.left ?? 0,
                              child: AnimatedSize(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.decelerate,
                                child: Container(
                                  width: indicatorSnapshot.data?.width ?? 0,
                                  height: 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.blue,
                                  ),
                                ),
                              ));
                        })
                  ],
                )
              ]),
            ),
          );
        });
  }
}
