import 'package:app_1/components/Home/Categories/home_category_container.dart';
import 'package:app_1/components/Home/Countries/home_countries_container.dart';
import 'package:app_1/components/Home/Places/home_places_container.dart';
import 'package:app_1/components/Home/TopResults/home_top_results_container.dart';
import 'package:app_1/shared/wrappers/inverted_border_wrapper.dart';
import 'package:flutter/material.dart';

class HomeContentContainer extends StatefulWidget {
  const HomeContentContainer({super.key});

  @override
  State<HomeContentContainer> createState() => _HomeContentContainerState();
}

class _HomeContentContainerState extends State<HomeContentContainer> {
  // @override
  // int get hashCode => 1;
  // @override
  // bool operator ==(covariant _HomeContentContainerState x) {
  //   return true;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HomeCategoryContainer(),
          HomeTopResultsContainer(),
          HomeCountriesContainer(),
          HomePlacesContainer()
        ],
      ),
    );
  }
}
