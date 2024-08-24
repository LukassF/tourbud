import 'dart:io';
import 'dart:math';
import 'package:app_1/shared/buttons/cancel_button.dart';
import 'package:app_1/shared/buttons/menu_button.dart';
import 'package:app_1/shared/inputs/search_input.dart';
import 'package:app_1/state/app_controller.dart';
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
    return StreamBuilder<double>(
        stream: appController.statusBarHeightStream,
        builder: (context, statusBarSnapshot) {
          return Positioned(
              height: 65 + (statusBarSnapshot.data ?? 0),
              width: MediaQuery.sizeOf(context).width,
              child: StreamBuilder<double>(
                  stream: homeController.scrollDistanceStream,
                  builder: (context, snapshot) {
                    double radius =
                        snapshot.data != null && snapshot.data! < 350
                            ? min((snapshot.data ?? 0) / 11.6, 30)
                            : 0;
                    double opacity = min((snapshot.data ?? 0) / 350, 1);

                    return Container(
                      padding:
                          EdgeInsets.only(top: statusBarSnapshot.data ?? 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(radius),
                            bottomRight: Radius.circular(radius)),
                        color: Colors.white.withOpacity(opacity),
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
        });
  }
}
