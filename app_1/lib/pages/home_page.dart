import 'package:flutter/material.dart';
import 'package:app_1/components/Home/ContentContainer/home_content_container.dart';
import 'package:app_1/components/Home/TopContainer/home_top_container.dart';
import 'package:app_1/components/Home/TopContainer/home_top_container_background.dart';
import 'package:app_1/components/SearchView/search_view.dart';
import 'package:app_1/shared/heders/header.dart';
import 'package:app_1/shared/overlays/basic_overlay.dart';
import 'package:app_1/state/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          HomeTopContainerBackground(),
          NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              // Ensure the notification is from the specific ScrollController
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
              child: Stack(
                children: [
                  HomeTopContainer(),
                  HomeContentContainer(),
                ],
              ),
              // Positioned(
              //   top: 370,
              //   width: MediaQuery.sizeOf(context).width,
              //   height: 60,
              //   child: Expanded(
              //       child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //     child: Row(
              //       children: [
              //         Container(
              //           padding: EdgeInsets.symmetric(horizontal: 16),
              //           height: 45,
              //           decoration: BoxDecoration(
              //               color: Theme.of(context).colorScheme.primary,
              //               borderRadius: BorderRadius.circular(16),
              //               boxShadow: [
              //                 BoxShadow(
              //                   color: Colors.black.withOpacity(0.4),
              //                   blurRadius: 10.0,
              //                   spreadRadius: -2,
              //                   offset: const Offset(0.0, 6.0),
              //                 )
              //               ]),
              //           child: Row(
              //             children: [
              //               Container(
              //                 margin: EdgeInsets.only(right: 5),
              //                 child: SvgPicture.asset(
              //                   'assets/icons/clock.svg',
              //                   width: 20,
              //                 ),
              //               ),
              //               Text(
              //                 '12 days',
              //                 style: TextStyle(
              //                     color: Colors.white, fontSize: 13),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   )),
              // ),
            ),
          ),
          StreamBuilder<bool>(
              stream: homeController.isSearchOpenStream,
              builder: (context, snapshot) {
                return BasicOverlay(
                  isOpen: snapshot.data ?? false,
                  child: SearchView(),
                );
              }),
          Header(),
        ],
      ),
    );
  }
}
