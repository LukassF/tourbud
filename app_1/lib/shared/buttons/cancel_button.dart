import 'package:app_1/shared/wrappers/text_ripple_wrapper.dart';
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
          duration: const Duration(milliseconds: 200),
          child: TextRippleWrapper(
            padding: EdgeInsets.all(10),
            onPressed: widget.onClick,
            child: Text(
              'Cancel',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 14),
            ),
          ),
        ));
  }
}
