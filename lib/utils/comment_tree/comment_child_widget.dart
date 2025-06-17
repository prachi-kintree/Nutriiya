import 'package:easy_localization/easy_localization.dart' as locale;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './tree_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentChildWidget extends StatelessWidget {
  final PreferredSizeWidget? avatar;
  final Widget? content;
  final bool? isLast;
  final Size? avatarRoot;
  final BuildContext? context;

  const CommentChildWidget({
    required this.isLast,
    required this.context,
    required this.avatar,
    required this.content,
    required this.avatarRoot,
  });

  @override
  Widget build(BuildContext context) {
    bool isRTL = Directionality.of(context) == TextDirection.rtl;
    final EdgeInsets padding = EdgeInsets.only(
        left: isRTL ? 0 : avatarRoot!.width + 25.w,
        bottom: 8,
        top: 8,
        right: isRTL ? avatarRoot!.width + 25.w : 0);

    return CustomPaint(
      painter: _Painter(
        isLast: isLast!,
        context: context,
        padding: padding,
        textDirection: Directionality.of(context),
        avatarRoot: avatarRoot,
        avatarChild: avatar!.preferredSize,
        pathColor: context.watch<TreeThemeData>().lineColor,
        strokeWidth: context.watch<TreeThemeData>().lineWidth,
      ),
      child: Container(
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            avatar!,
            const SizedBox(
              width: 8,
            ),
            Expanded(child: content!),
          ],
        ),
      ),
    );
  }
}

class _Painter extends CustomPainter {
  bool isLast = false;

  EdgeInsets? padding;
  final TextDirection textDirection;
  Size? avatarRoot;
  Size? avatarChild;
  Color? pathColor;
  double? strokeWidth;
  BuildContext? context;

  _Painter({
    required this.context,
    required this.isLast,
    required this.textDirection,
    this.padding,
    this.avatarRoot,
    this.avatarChild,
    this.pathColor,
    this.strokeWidth,
  }) {
    _paint = Paint()
      ..color = pathColor!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth!
      ..strokeCap = StrokeCap.round;
  }

  late Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();
    if (textDirection == TextDirection.rtl) canvas.translate(size.width, 10);
    double rootDx = avatarRoot!.width / 1.5;
    if (textDirection == TextDirection.rtl) rootDx *= -1;
    path.moveTo(rootDx, 0);
    path.conicTo(
      rootDx,
      31,
        (context?.locale != Locale("ar") && context?.locale != Locale("ur")) ? (rootDx + 34) : (rootDx - 34),
      padding!.top + avatarChild!.height /1.1 ,
      12
      // rootDx * 3,
      // padding!.top + avatarChild!.height / 2 +20,
    );
    canvas.drawPath(path, _paint);

    if (!isLast) {
      canvas.drawLine(
        Offset(rootDx, 0),
        Offset(rootDx, size.height ),
        _paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
