import 'package:app_1/classes/home/constants.dart';
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
          return SizedBox(
            height: 50,
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
                        children: HomeConstants.CATEGORIES
                            .asMap()
                            .entries
                            .map(
                              (category) => HomeCategoryCard(
                                isActive: snapshot.data == category.key,
                                text: category.value.label,
                                isFirst: category.key == 0,
                                isLast: category.key ==
                                    HomeConstants.CATEGORIES.length - 1,
                                index: category.key,
                                onClick: category.value.onClick,
                              ),
                            )
                            .toList()),
                    StreamBuilder<IIndicatorLayout>(
                        stream:
                            homeController.categoryIndicatorPosition.distinct(),
                        builder: (context, indicatorSnapshot) {
                          return AnimatedPositioned(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.decelerate,
                              bottom: 5,
                              left: indicatorSnapshot.data?.left ?? 0,
                              child: AnimatedSize(
                                duration: const Duration(milliseconds: 200),
                                child: Container(
                                  width: indicatorSnapshot.data?.width ?? 0,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.1),
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
