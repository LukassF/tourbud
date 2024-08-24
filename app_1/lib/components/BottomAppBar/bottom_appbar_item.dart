import 'package:app_1/state/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomAppBarItem extends StatelessWidget {
  final String icon;
  final bool active;
  final void Function() onClick;
  final double? width;
  final double? height;

  const BottomAppBarItem(
      {super.key,
      required this.active,
      required this.icon,
      required this.onClick,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();

    return InkWell(
      onTap: () {
        onClick();
        BuildContext? context = key.currentContext;
        if (context != null) {
          RenderBox box = context.findRenderObject() as RenderBox;
          Offset position = box.localToGlobal(Offset.zero);
          double left = position.dx + 20;
          print(left);

          appController.updateTabIndicatorPosition(left);
        }
      },
      child: Container(
        key: key,
        width: 60,
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SvgPicture.asset(icon,
              height: height ?? 24,
              width: width ?? 24,
              colorFilter: ColorFilter.mode(
                  active
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey.shade400,
                  BlendMode.srcIn),
              semanticsLabel: 'A red up arrow'),
        ]),
      ),
    );
  }
}
