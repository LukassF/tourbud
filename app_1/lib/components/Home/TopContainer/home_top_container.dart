import 'package:flutter/material.dart';

class HomeTopContainer extends StatefulWidget {
  const HomeTopContainer({super.key});

  @override
  State<HomeTopContainer> createState() => _HomeTopContainerState();
}

class _HomeTopContainerState extends State<HomeTopContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(height: 340, margin: EdgeInsets.only(top: 60));
  }
}
