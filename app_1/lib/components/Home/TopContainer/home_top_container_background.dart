import 'dart:ui';
import 'package:app_1/state/home_controller.dart';
import 'package:flutter/material.dart';

class HomeTopContainerBackground extends StatelessWidget {
  const HomeTopContainerBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        stream: homeController.scrollDistanceStream.distinct(),
        builder: (context, snapshot) {
          return Positioned(
            top: snapshot.data != null && snapshot.data! < 100
                ? -snapshot.data!
                : -100 - (((snapshot.data ?? 0) - 100) / 2.5),
            height: 420,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/beach.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Column(
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
                Positioned(
                    height: 420,
                    width: MediaQuery.sizeOf(context).width,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                        child: Container(
                          color: Colors.black.withOpacity(0.2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Strolling in',
                                style: TextStyle(
                                    color: Colors.grey[300],
                                    fontSize: 24,
                                    fontFamily: 'Dancing',
                                    height: 0.5),
                              ),
                              const Text(
                                'Burano, Italy',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          );
        });
  }
}
