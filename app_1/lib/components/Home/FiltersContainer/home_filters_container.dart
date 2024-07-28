import 'package:app_1/components/Home/FiltersContainer/home_filter_card.dart';
import 'package:flutter/material.dart';

class HomeFiltersContainer extends StatefulWidget {
  const HomeFiltersContainer({super.key});

  @override
  State<HomeFiltersContainer> createState() => _HomeFiltersContainerState();
}

class _HomeFiltersContainerState extends State<HomeFiltersContainer> {
  int _activeCategory = 0;

  void setNewCategory(int index) {
    setState(() {
      _activeCategory = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 832,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10.0,
              spreadRadius: -5,
              offset: const Offset(0.0, -6.0),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Expanded(
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 16),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         const Text(
          //           'Chosen for you',
          //           style: TextStyle(fontWeight: FontWeight.w100, fontSize: 18),
          //         ),
          //         Text(
          //           'View all',
          //           style: TextStyle(
          //             fontWeight: FontWeight.w100,
          //             fontSize: 15,
          //             color: Colors.grey[500],
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          Container(
            height: 60,
            child:
                ListView(scrollDirection: Axis.horizontal, children: <Widget>[
              HomeFiterCard(
                isActive: _activeCategory == 0,
                text: 'Leisure',
                isFirst: true,
                index: 0,
                onClick: setNewCategory,
              ),
              HomeFiterCard(
                  isActive: _activeCategory == 1,
                  text: 'Nearby hikes',
                  index: 1,
                  onClick: setNewCategory),
              HomeFiterCard(
                  isActive: _activeCategory == 2,
                  text: 'Adrenaline rush',
                  index: 2,
                  onClick: setNewCategory),
              HomeFiterCard(
                  isActive: _activeCategory == 3,
                  text: 'Leisure',
                  isLast: true,
                  index: 3,
                  onClick: setNewCategory)
            ]),
          )
        ],
      ),
    );
  }
}
