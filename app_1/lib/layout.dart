import 'package:app_1/components/BottomAppBar/bottom_appbar.dart';
import 'package:app_1/pages/dashboard_page.dart';
import 'package:app_1/pages/explore_page.dart';
import 'package:app_1/pages/profile_page.dart';
import 'package:app_1/pages/home_page.dart';
import 'package:app_1/state/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SafeArea(
              child: StreamBuilder(
            stream: appController.currentPageIndexStream,
            builder: (context, snapshot) => IndexedStack(
              index: snapshot.data,
              children: [
                HomePage(),
                ExplorePage(),
                DashboardPage(),
                ProfilePage()
              ],
            ),
          )),
        ),
        bottomNavigationBar: BottomBar());
  }
}
