import 'package:flutter/material.dart';

class HomeFiterCard extends StatelessWidget {
  final bool isActive;
  final String text;
  final int index;
  final void Function(int index) onClick;
  final bool? isFirst;
  final bool? isLast;
  const HomeFiterCard(
      {super.key,
      required this.isActive,
      required this.text,
      required this.index,
      required this.onClick,
      this.isFirst,
      this.isLast});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick(index);
      },
      child: Container(
        margin: EdgeInsets.only(
            top: 8,
            bottom: 8,
            left: (isFirst ?? false) ? 16 : 8,
            right: (isLast ?? false) ? 16 : 8),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isActive ? Colors.blue : Colors.transparent,
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5.0,
                      spreadRadius: 1,
                      offset: const Offset(0.0, 2.0),
                    )
                  ]
                : []),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontSize: 16, color: isActive ? Colors.white : Colors.grey[400]),
        )),
      ),
    );
  }
}
