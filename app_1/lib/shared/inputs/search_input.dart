import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchInput extends StatefulWidget {
  final bool isSearch;
  final void Function(bool open) onSearchToggle;

  const SearchInput(
      {super.key, required this.isSearch, required this.onSearchToggle});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final FocusNode _focusNode = FocusNode();
  final _inputController = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose();
    _inputController.dispose();
    super.dispose();
  }

  void onIconTapAction() {
    widget.onSearchToggle(!widget.isSearch);
    if (widget.isSearch) {
      _focusNode.unfocus();
      _inputController.clear();
    }
  }

  void onSearchFocus() {
    widget.onSearchToggle(true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: widget.isSearch ? 400 : 250),
      curve: Curves.decelerate,
      top: 16,
      left: widget.isSearch ? 16 : 57,
      height: 40,
      width: MediaQuery.sizeOf(context).width - (widget.isSearch ? 32 : 73),
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
          child: TextField(
              focusNode: _focusNode,
              controller: _inputController,
              onTap: onSearchFocus,

              // Text styles
              cursorColor: Colors.blue,
              style: const TextStyle(fontSize: 16),

              // decorations
              decoration: InputDecoration(
                  hintText: 'Search places',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  suffixIcon: GestureDetector(
                    onTap: onIconTapAction,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SvgPicture.asset(
                        widget.isSearch
                            ? 'assets/icons/close.svg'
                            : 'assets/icons/search.svg',
                        height: 14,
                        colorFilter: ColorFilter.mode(
                            Colors.grey.shade400, BlendMode.srcIn),
                      ),
                    ),
                  ),

                  // decoration styles
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  filled: true,
                  fillColor: Colors.white))),
    );
  }
}
