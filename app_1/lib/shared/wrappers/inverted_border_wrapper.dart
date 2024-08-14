import 'package:flutter/material.dart';

class SwTicketBorder extends ShapeBorder {
  final double radius;
  final Color? fillColor;
  final bool topLeft;
  final bool topRight;
  final bool bottomLeft;
  final bool bottomRight;

  const SwTicketBorder({
    required this.radius,
    this.fillColor,
    this.topLeft = true,
    this.topRight = true,
    this.bottomLeft = true,
    this.bottomRight = true,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect, textDirection: textDirection), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      _createPath(rect);

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (fillColor != null) {
      final fillPaint = Paint()
        ..color = fillColor! // Use the provided fillColor
        ..style = PaintingStyle.fill;
      final fillPath = getInnerPath(rect, textDirection: textDirection);
      canvas.drawPath(fillPath, fillPaint);
    }
  }

  Path _createPath(Rect rect) {
    Path path = Path();

    double inset = radius;

    path.moveTo(rect.left + inset, rect.top + inset);

    path.lineTo(rect.right - inset, rect.top + inset);
    path.arcToPoint(
      Offset(rect.right, rect.top),
      radius: Radius.circular(inset),
      clockwise: !topRight,
    );

    path.lineTo(rect.right, rect.bottom);
    path.arcToPoint(
      Offset(rect.right - inset, rect.bottom - inset),
      radius: Radius.circular(inset),
      clockwise: !bottomRight,
    );

    path.lineTo(rect.left + inset, rect.bottom - inset);
    path.arcToPoint(
      Offset(rect.left, rect.bottom),
      radius: Radius.circular(inset),
      clockwise: !bottomLeft,
    );

    path.lineTo(rect.left, rect.top);
    path.arcToPoint(
      Offset(rect.left + inset, rect.top + inset),
      radius: Radius.circular(inset),
      clockwise: !topLeft,
    );

    path.close();

    return path;
  }

  @override
  ShapeBorder scale(double t) {
    return SwTicketBorder(
      radius: radius * t,
      topLeft: topLeft,
      topRight: topRight,
      bottomLeft: bottomLeft,
      bottomRight: bottomRight,
    );
  }
}
