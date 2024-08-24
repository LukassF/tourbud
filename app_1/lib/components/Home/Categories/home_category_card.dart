import 'package:app_1/classes/home/interfaces.dart';
import 'package:app_1/state/home_controller.dart';
import 'package:flutter/material.dart';

class HomeCategoryCard extends StatefulWidget {
  final bool isActive;
  final String text;
  final int index;
  final void Function(int index) onClick;
  final bool? isFirst;
  final bool? isLast;
  const HomeCategoryCard(
      {super.key,
      required this.isActive,
      required this.text,
      required this.index,
      required this.onClick,
      this.isFirst,
      this.isLast});

  @override
  State<HomeCategoryCard> createState() => _HomeCategoryCardState();
}

class _HomeCategoryCardState extends State<HomeCategoryCard> {
  final key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        stream: homeController.categoryListScrollDistance,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () {
              widget.onClick(widget.index);
              BuildContext? context = key.currentContext;
              if (context != null) {
                RenderBox box = context.findRenderObject() as RenderBox;
                Offset position = box.localToGlobal(Offset.zero);
                double left =
                    widget.isFirst == true ? position.dx + 16 : position.dx + 4;

                double width = 0;
                if (context.size != null) {
                  width = widget.isFirst == true || widget.isLast == true
                      ? context.size!.width - 20
                      : context.size!.width - 8;
                }

                homeController.updateCategoryIndicatorPosition(IIndicatorLayout(
                    left: left + (snapshot.data ?? 0), width: width));
              }
            },
            child: Container(
              key: key,
              margin: EdgeInsets.only(
                  left: (widget.isFirst ?? false) ? 16 : 8,
                  right: (widget.isLast ?? false) ? 16 : 8),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Center(
                  child: Text(
                widget.text,
                style: TextStyle(
                    fontSize: 14,
                    color: widget.isActive
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[400],
                    fontWeight: FontWeight.normal),
              )),
            ),
          );
        });
  }
}
