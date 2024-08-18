import 'package:flutter/material.dart';
import 'package:app_1/components/Home/ContentContainer/home_content_container.dart';
import 'package:app_1/components/Home/TopContainer/home_top_container.dart';
import 'package:app_1/components/Home/TopContainer/home_top_container_background.dart';
import 'package:app_1/components/SearchView/search_view.dart';
import 'package:app_1/shared/heders/header.dart';
import 'package:app_1/shared/overlays/basic_overlay.dart';
import 'package:app_1/state/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _homePageScrollKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const HomeTopContainerBackground(),
          NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              // Ensure the notification is from the main vertical scrollview
              if (scrollNotification.metrics.axis == Axis.vertical) {
                homeController
                    .setScrollDistance(scrollNotification.metrics.pixels);
                return true;
              }
              return false;
            },
            child: SingleChildScrollView(
              key: _homePageScrollKey,
              controller: _scrollController,
              child: const Stack(
                children: [
                  HomeTopContainer(),
                  HomeContentContainer(),
                ],
              ),
            ),
          ),
          StreamBuilder<bool>(
              stream: homeController.isSearchOpenStream,
              builder: (context, snapshot) {
                return BasicOverlay(
                  isOpen: snapshot.data ?? false,
                  child: const SearchView(),
                );
              }),
          const Header(),
        ],
      ),
    );
  }
}
