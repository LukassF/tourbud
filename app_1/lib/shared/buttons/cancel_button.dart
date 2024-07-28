import 'package:flutter/material.dart';

class CancelButton extends StatefulWidget {
  final bool isSearch;
  final void Function() onClick;

  const CancelButton(
      {super.key, required this.isSearch, required this.onClick});

  @override
  State<CancelButton> createState() => _CancelButtonState();
}

class _CancelButtonState extends State<CancelButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 16,
        top: 10,
        height: 40,
        child: AnimatedOpacity(
          opacity: widget.isSearch ? 1 : 0,
          duration: const Duration(milliseconds: 400),
          child: TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
            onPressed: widget.onClick,
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
            ),
          ),
        ));
  }
}
