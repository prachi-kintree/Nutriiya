import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles/app_text_styles.dart';


Widget buildChip(
    {String label = "",
    Color color = Colors.green,
    VoidCallback? onDeletePressed,
    bool isForView = false}) {
  return Chip(
    labelPadding: EdgeInsets.all(4.0),
    label: Text(
      label,
      style: AppTextStyle.outfitStyle(
          withTextStyle: TextStyle(color: Colors.black),
          outfitFont: OutfitFontStyle.medium),
    ),
    deleteIcon: isForView
        ? null
        : Icon(
          CupertinoIcons.clear_circled,
          size: 18.h,
        ),
    onDeleted: isForView ? null : onDeletePressed,
    backgroundColor: color,
    elevation: 6.0,
    shadowColor: Colors.grey[60],
    padding: EdgeInsets.all(8.0),
  );
}
