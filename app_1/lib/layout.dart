import 'package:app_1/components/BottomAppBar/bottom_appbar.dart';
import 'package:app_1/components/SearchView/search_view.dart';
import 'package:app_1/pages/dashboard_page.dart';
import 'package:app_1/pages/explore_page.dart';
import 'package:app_1/pages/profile_page.dart';
import 'package:app_1/pages/home_page.dart';
import 'package:app_1/shared/heders/header.dart';
import 'package:app_1/shared/overlays/basic_overlay.dart';
import 'package:app_1/state/app_controller.dart';
import 'package:app_1/state/home_controller.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            // child: SafeArea(
            child: StreamBuilder(
              stream: appController.currentPageIndexStream,
              builder: (context, snapshot) => Stack(
                children: [
                  IndexedStack(
                    index: snapshot.data,
                    children: const [
                      HomePage(),
                      ExplorePage(),
                      DashboardPage(),
                      ProfilePage()
                    ],
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
            )),
        bottomNavigationBar: const BottomBar());
  }
}
