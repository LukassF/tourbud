import 'package:app_1/components/Home/FiltersContainer/home_filters_container.dart';
import 'package:app_1/components/Home/TopContainer/home_top_container.dart';
import 'package:app_1/components/Home/TopContainer/home_top_container_background.dart';
import 'package:app_1/components/SearchView/search_view.dart';
import 'package:app_1/shared/heders/header.dart';
import 'package:app_1/shared/overlays/basic_overlay.dart';
import 'package:app_1/state/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomeTopContainerBackground(),
          NotificationListener<ScrollNotification>(
            child: const SingleChildScrollView(
              child: Column(
                children: [HomeTopContainer(), HomeFiltersContainer()],
              ),
            ),
            onNotification: (scrollNotification) {
              homeController
                  .setScrollDistance(scrollNotification.metrics.pixels);
              return false;
            },
          ),
          StreamBuilder<bool>(
              stream: homeController.isSearchOpenStream,
              builder: (context, snapshot) {
                return BasicOverlay(
                  isOpen: snapshot.data ?? false,
                  child: SearchView(),
                );
              }),
          Header()
        ],
      ),
    );
  }
}


 // String username = "";
  // void fetchUser() async {
  //   if (widget.accessToken.isNotEmpty) {
  //     Response user = await get(
  //         Uri.parse('${Constants.BACKEND_BASE_URL}api/v1/users/2'),
  //         headers: {"Authorization": "Bearer ${widget.accessToken}"});

  //     var res = jsonDecode(user.body);

  //     print(res);
  //   }
  // }
