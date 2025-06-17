import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../app_string/app_image_path.dart';
import '../styles/app_text_styles.dart';
import '../theme/theme_model.dart';


class ExpandablePanel extends StatefulWidget {
  final String title;
  final Widget body;
  List<ExpansionTileController>? controllers;
  int? index;

  ExpandablePanel(
      {required this.title, required this.body, this.controllers, this.index});

  @override
  _ExpandablePanelState createState() => _ExpandablePanelState();
}

class _ExpandablePanelState extends State<ExpandablePanel> {
  bool isExpanded = false;
  int? _expandedTileIndex;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        controller: widget.controllers![widget.index!],
        initiallyExpanded: _expandedTileIndex == widget.index,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.topCenter,
        childrenPadding: EdgeInsets.zero,
        tilePadding: EdgeInsets.only(top: 5, left: 15, right: 15),
        minTileHeight: 20,

        // collapsedShape: RoundedRectangleBorder(
        //   side: BorderSide(color: Colors.black12),
        //   borderRadius: BorderRadius.circular(12)
        // ),
        // shape: RoundedRectangleBorder(
        //   side: BorderSide(color: Colors.black12),
        //     borderRadius: BorderRadius.circular(12)
        //
        // ),

        // collapsedShape: ShapeBorder.lerp(StadiumBorder(side: BorderSide(color: Colors.black,style: BorderStyle.solid)), StadiumBorder(side: BorderSide(color: Colors.black,style: BorderStyle.solid)),0.5),
        // shape: ShapeBorder.lerp(StadiumBorder(side: BorderSide(color: Colors.black,style: BorderStyle.solid)), StadiumBorder(side: BorderSide(color: Colors.black,style: BorderStyle.solid)),0.5),
        // tilePadding: EdgeInsets.only(top: 5),
        // expansionAnimationStyle: AnimationStyle.noAnimation,
        // visualDensity: VisualDensity.compact,
        dense: true,
        onExpansionChanged: (bool expanded) {
          setState(() {
            isExpanded = expanded;

            ///This is to be uncommented in the next build.
            // if (expanded) {
            //   // Collapse all other tiles
            //   for (int i = 0; i < widget.controllers!.length; i++) {
            //     if (i != widget.index) {
            //       widget.controllers![i].collapse();
            //     }
            //   }
            //   _expandedTileIndex = widget.index;
            // } else if (_expandedTileIndex == widget.index) {
            //   _expandedTileIndex = null;
            // }
          });
          // setState(() {
          //   isExpanded = expanded;
          //   if (expanded) {
          //     _expandedTileIndex = widget.title;
          //   } else if (_expandedTileIndex == widget.title) {
          //     _expandedTileIndex = null;
          //   }
          // });
        },

        // onExpansionChanged: (value) {
        //   setState(() {
        //     isExpanded = value;
        //   });
        // },
        trailing: isExpanded
            ? SvgPicture.asset(height: 15.h, svgFaqClose)
            : SvgPicture.asset(
                height: 15.h,
                svgFaqOpen,
                colorFilter: ColorFilter.mode(
                    ThemeManagerPlus.of<AppTheme>(context).currentTheme.black!,
                    BlendMode.srcIn)),
        title: Container(
            child: Text(
          "${widget.title.trim()}",
          style: AppTextStyle.jakartaStyle(
              withTextStyle: TextStyle(
                  color:
                      ThemeManagerPlus.of<AppTheme>(context).currentTheme.black,
                  fontSize: 16.sp),
              jakartaFont: JakartaStyle.bold),
        )),
        collapsedTextColor: Colors.black,
        textColor: Colors.black,
        children: [widget.body],
      ),
    );
  }
}
