import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../utils/styles/app_text_styles.dart';
import '../../../utils/theme/theme_model.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> options;
  final String selectedValue;
  const CustomDropdown({required this.options, required this.selectedValue});
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown>
    with SingleTickerProviderStateMixin {
  late String selectedValue;
  bool isOpen = false;

  late AnimationController _controller;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void toggleDropdown() {
    setState(() {
      isOpen = !isOpen;
      isOpen ? _controller.forward() : _controller.reverse();
    });
  }

  void selectOption(String value) {
    setState(() {
      selectedValue = value;
      isOpen = false;
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDropdownItems() {
    return SizeTransition(
      sizeFactor: _expandAnimation,
      axisAlignment: -1.0,
      child: Container(
        margin: const EdgeInsets.only(top: 4),
        decoration: BoxDecoration(
          color:
              ThemeManagerPlus.of<AppTheme>(context).currentTheme.textFieldGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: widget.options.map((option) {
            return InkWell(
              onTap: () => selectOption(option),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    child: Text(option,
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular)),
                  ),
                  if (option != "Other (Add manually)")
                    const Divider(
                      height: 0,
                      thickness: 1,
                    )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: toggleDropdown,
            child: Container(
              width: double.infinity,
              height: 50.h,
              margin: EdgeInsets.only(bottom: 10.h),
              decoration: BoxDecoration(
                color: ThemeManagerPlus.of<AppTheme>(context)
                    .currentTheme
                    .textFieldGrey,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(selectedValue,
                      style: AppTextStyle.outfitStyle(
                          withTextStyle:
                              TextStyle(fontSize: 16.sp, color: Colors.black),
                          outfitFont: OutfitFontStyle.regular)),
                  SvgPicture.asset(isOpen ? svgDropUp : svgDropDown,
                      height: 8.h)
                ],
              ),
            ),
          ),
          _buildDropdownItems(),
        ],
      ),
    );
  }
}
