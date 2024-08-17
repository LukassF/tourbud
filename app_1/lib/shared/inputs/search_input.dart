import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchInput extends StatefulWidget {
  final bool isSearch;
  final void Function(bool open) onSearchToggle;
  final TextEditingController inputController;
  final FocusNode focusNode;

  const SearchInput(
      {super.key,
      required this.isSearch,
      required this.onSearchToggle,
      required this.focusNode,
      required this.inputController});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  void onSearchFocus() {
    widget.onSearchToggle(true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 400),
      curve: Curves.decelerate,
      top: 10,
      left: widget.isSearch ? 16 : 65,
      height: 40,
      width: MediaQuery.sizeOf(context).width - (widget.isSearch ? 107 : 81),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.2),
            //     blurRadius: 10.0,
            //     spreadRadius: -5,
            //     offset: const Offset(0.0, 6.0),
            //   )
            // ]
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(),
            child: TextField(
                focusNode: widget.focusNode,
                controller: widget.inputController,
                onTap: onSearchFocus,

                // Text styles
                cursorColor: Colors.black.withOpacity(0.3),
                style: const TextStyle(fontSize: 16),

                // decorations
                decoration: InputDecoration(
                    hintText: 'Search places',
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                    prefixIcon: GestureDetector(
                      onTap: onSearchFocus,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SvgPicture.asset(
                          'assets/icons/search.svg',
                          height: 14,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3), BlendMode.srcIn),
                        ),
                      ),
                    ),

                    // decoration styles
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.3), width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.3), width: 0.0),
                    ),
                    filled: true,
                    fillColor: Colors.white)),
          )),
    );
  }
}
