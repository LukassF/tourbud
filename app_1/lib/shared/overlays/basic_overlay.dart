import 'package:flutter/material.dart';

class BasicOverlay extends StatefulWidget {
  final bool isOpen;
  final Widget? child;
  const BasicOverlay({super.key, required this.isOpen, this.child});

  @override
  State<BasicOverlay> createState() => _BasicOverlayState();
}

class _BasicOverlayState extends State<BasicOverlay> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 0,
        height: widget.isOpen ? MediaQuery.sizeOf(context).height : 0,
        width: widget.isOpen ? MediaQuery.sizeOf(context).width : 0,
        child: AnimatedOpacity(
          curve: Curves.decelerate,
          duration: const Duration(milliseconds: 250),
          opacity: widget.isOpen ? 1 : 0,
          child: Container(
            color: Colors.white,
            child: widget.child,
          ),
        ));
  }
}
