import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopContainer extends StatelessWidget {
  const HomeTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/hamburger-menu.svg',
                      width: 25,
                      colorFilter: ColorFilter.mode(
                          Colors.grey.shade600, BlendMode.srcIn),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
