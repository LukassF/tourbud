import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopContainer extends StatefulWidget {
  const HomeTopContainer({super.key});

  @override
  State<HomeTopContainer> createState() => _HomeTopContainerState();
}

class _HomeTopContainerState extends State<HomeTopContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.only(top: 60),
    );
  }
}
