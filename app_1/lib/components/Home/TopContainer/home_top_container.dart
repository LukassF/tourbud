import 'package:app_1/state/home_controller.dart';
import 'package:flutter/material.dart';

class HomeTopContainer extends StatefulWidget {
  const HomeTopContainer({super.key});

  @override
  State<HomeTopContainer> createState() => _HomeTopContainerState();
}

class _HomeTopContainerState extends State<HomeTopContainer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        stream: homeController.scrollDistanceStream.distinct(),
        builder: (context, snapshot) {
          final bool showHighlight =
              ((snapshot.data ?? 0) > 150) ? false : true;
          return Container(
            height: 450,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(children: [
              // Positioned(
              //     bottom: 20,
              //     left: 20,
              //     child: AnimatedOpacity(
              //       duration: const Duration(milliseconds: 250),
              //       opacity: showHighlight ? 1 : 0,
              //       child: Container(
              //         height: 35,
              //         width: 105,
              //         decoration: BoxDecoration(
              //           borderRadius: const BorderRadius.only(
              //               topLeft: Radius.circular(10),
              //               topRight: Radius.circular(10),
              //               bottomLeft: Radius.circular(40),
              //               bottomRight: Radius.circular(10)),
              //           color: Theme.of(context).colorScheme.primary,
              //         ),
              //         child: Container(
              //           margin: EdgeInsets.only(left: 8),
              //           child: Center(
              //             child: Text(
              //               '#1 Today',
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 12,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ))
            ]),
          );
        });
  }
}
