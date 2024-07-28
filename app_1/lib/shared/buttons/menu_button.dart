import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuButton extends StatefulWidget {
  final bool isSearch;

  const MenuButton({super.key, required this.isSearch});

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: 40,
      width: 40,
      top: 10,
      left: 16,
      child: AnimatedOpacity(
        opacity: widget.isSearch ? 0 : 1,
        duration: const Duration(milliseconds: 250),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade400, width: 0.0)
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.2),
              //     blurRadius: 10.0,
              //     spreadRadius: -5,
              //     offset: const Offset(0.0, 6.0),
              //   )
              // ]
              ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/hamburger-menu.svg',
              width: 20,
              colorFilter:
                  ColorFilter.mode(Colors.grey.shade400, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}
