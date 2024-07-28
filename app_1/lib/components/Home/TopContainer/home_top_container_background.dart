import 'package:app_1/state/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopContainerBackground extends StatelessWidget {
  const HomeTopContainerBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        stream: homeController.scrollDistanceStream.distinct(),
        builder: (context, snapshot) {
          return Positioned(
            top: -((snapshot.data ?? 0) / 5),
            height: 420,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/burano.webp"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                      ),
                    ],
                  ),
                ),
                // Positioned(
                //     child: Container(
                //   decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //       colors: [
                //         Colors.white.withOpacity(0.8),
                //         Colors.white.withOpacity(0.2)
                //       ],
                //       stops: [0.15, 0.85],
                //       begin: Alignment.topCenter,
                //       end: Alignment.bottomCenter,
                //     ),
                //   ),
                // ))
              ],
            ),
          );
        });
  }
}
