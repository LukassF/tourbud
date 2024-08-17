import 'package:flutter/material.dart';

class TextRippleWrapper extends StatefulWidget {
  final Widget child;
  final Function onPressed;
  final Icon? icon;
  final EdgeInsetsGeometry? padding;
  const TextRippleWrapper(
      {super.key,
      required this.child,
      required this.onPressed,
      this.icon,
      this.padding});

  @override
  State<TextRippleWrapper> createState() => _TextRippleWrapperState();
}

class _TextRippleWrapperState extends State<TextRippleWrapper> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          isPressed = true;
        });
      },
      onLongPressEnd: (details) {
        setState(() {
          isPressed = false;
        });
        widget.onPressed();
      },
      onTapUp: ((details) {
        widget.onPressed();
        Future.delayed(const Duration(milliseconds: 250), () {
          setState(() {
            isPressed = false;
          });
        });
      }),
      child: Container(
        padding: widget.padding,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 90),
          curve: Curves.decelerate,
          opacity: isPressed ? 0.5 : 1,
          child: widget.child,
        ),
      ),
    );
  }
}
