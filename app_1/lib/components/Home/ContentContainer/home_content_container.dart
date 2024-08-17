import 'package:app_1/components/Home/Categories/home_category_card.dart';
import 'package:app_1/components/Home/Categories/home_category_container.dart';
import 'package:app_1/components/Home/TopResults/home_top_results_container.dart';
import 'package:app_1/shared/wrappers/inverted_border_wrapper.dart';
import 'package:flutter/material.dart';

class HomeContentContainer extends StatefulWidget {
  const HomeContentContainer({super.key});

  @override
  State<HomeContentContainer> createState() => _HomeContentContainerState();
}

class _HomeContentContainerState extends State<HomeContentContainer> {
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
      margin: const EdgeInsets.only(top: 370),
      padding: const EdgeInsets.only(top: 56),
      decoration: const ShapeDecoration(
        shape: SwTicketBorder(
            radius: 40,
            fillColor: Colors.white,
            topLeft: true,
            topRight: true,
            bottomLeft: false,
            bottomRight: false),
      ),
      // decoration: BoxDecoration(color: Colors.white, boxShadow: [
      //   BoxShadow(
      //     color: Colors.black.withOpacity(0.2),
      //     blurRadius: 10.0,
      //     spreadRadius: -5,
      //     offset: const Offset(0.0, -6.0),
      //   )
      // ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [HomeCategoryContainer(), HomeTopResultsContainer()],
      ),
    );
  }
}
