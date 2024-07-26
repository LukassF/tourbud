import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchInput extends StatefulWidget {
  final bool isSearch;
  void Function(bool open) onSearchToggle;

  SearchInput(
      {super.key, required this.isSearch, required this.onSearchToggle});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: widget.isSearch ? 400 : 250),
      curve: Curves.decelerate,
      top: widget.isSearch ? 16 : 106,
      left: 16,
      height: 60,
      width: MediaQuery.sizeOf(context).width - 32,
      child: SizedBox(
          child: TextField(
              cursorColor: Colors.blue,
              onTap: () {
                widget.onSearchToggle(true);
              },
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
                  suffixIcon: GestureDetector(
                    onTap: () {
                      widget.onSearchToggle(!widget.isSearch);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Colors.grey.shade500, width: 0))),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SvgPicture.asset(
                        widget.isSearch
                            ? 'assets/icons/close.svg'
                            : 'assets/icons/search.svg',
                        height: 18,
                        colorFilter: ColorFilter.mode(
                            Colors.grey.shade400, BlendMode.srcIn),
                      ),
                    ),
                  ),
                  hintText: 'Search places',
                  hintStyle: TextStyle(color: Colors.grey[400])))),
    );
  }
}
