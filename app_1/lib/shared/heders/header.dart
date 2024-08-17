import 'dart:math';

import 'package:app_1/shared/buttons/cancel_button.dart';
import 'package:app_1/shared/buttons/menu_button.dart';
import 'package:app_1/shared/inputs/search_input.dart';
import 'package:app_1/state/home_controller.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final _inputController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    _inputController.dispose();
    super.dispose();
  }

  void onCancelSearch(bool isSearch) {
    homeController.toggleSearch(!isSearch);
    if (isSearch) {
      _focusNode.unfocus();
      _inputController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        height: 65,
        width: MediaQuery.sizeOf(context).width,
        child: StreamBuilder<double>(
            stream: homeController.scrollDistanceStream,
            builder: (context, snapshot) {
              double radius = snapshot.data != null && snapshot.data! < 350
                  ? min((snapshot.data ?? 0) / 8.6, 40)
                  : 0;
              double opacity = min((snapshot.data ?? 0) / 350, 1);

              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(radius),
                      bottomRight: Radius.circular(radius)),
                  color: Colors.white.withOpacity(opacity),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black
                  //         .withOpacity(min((snapshot.data ?? 0) / 450, 0.1)),
                  //     blurRadius: 10.0,
                  //     spreadRadius: -5,
                  //     offset: const Offset(0.0, 6.0),
                  //   )
                  // ],
                ),
                child: StreamBuilder<bool>(
                    stream: homeController.isSearchOpenStream,
                    builder: (context, snapshot) {
                      final bool isOpen = snapshot.data ?? false;
                      return Stack(
                        children: [
                          MenuButton(
                            isSearch: isOpen,
                          ),
                          CancelButton(
                            isSearch: isOpen,
                            onClick: () {
                              onCancelSearch(isOpen);
                            },
                          ),
                          SearchInput(
                            isSearch: isOpen,
                            onSearchToggle: homeController.toggleSearch,
                            focusNode: _focusNode,
                            inputController: _inputController,
                          ),
                        ],
                      );
                    }),
              );
            }));
  }
}
