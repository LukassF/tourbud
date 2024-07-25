import 'package:app_1/components/BottomAppBar/BottomAppBar.dart';
import 'package:app_1/pages/ProfilePage.dart';
import 'package:app_1/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _pageIndex = 0;

  void setPage(int index) {
    setState(() {
      print(index);
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: IndexedStack(
          index: _pageIndex,
          children: [HomePage(), ProfilePage()],
        )),
        bottomNavigationBar: BottomBar(
          changePage: setPage,
          pageIndex: _pageIndex,
        ));
  }
}
