import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlidingTabSelector extends StatefulWidget {
  final List<String> options;
  final int initialIndex;
  final ValueChanged<int> onChanged;
  final double height;
  final double width;
  final EdgeInsets padding;
  final Color selectedColor;
  final Color unselectedColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;

  const SlidingTabSelector({
    Key? key,
    required this.options,
    this.initialIndex = 0,
    required this.onChanged,
    this.height = 50,
    this.width = 250,
    this.padding = const EdgeInsets.all(4),
    this.selectedColor = const Color(0xff42A004),
    this.unselectedColor = const Color(0xFFD9D9D9),
    this.selectedTextColor = Colors.white,
    this.unselectedTextColor = Colors.black,
  }) : super(key: key);

  @override
  _SlidingTabSelectorState createState() => _SlidingTabSelectorState();
}

class _SlidingTabSelectorState extends State<SlidingTabSelector> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    double tabWidth = widget.width / widget.options.length;

    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.unselectedColor,
        borderRadius: BorderRadius.circular(widget.height / 2),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            alignment: Alignment(
              -1.0 + (2.0 * selectedIndex / (widget.options.length - 1)),
              0,
            ),
            child: Container(
              width: tabWidth,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.selectedColor,
                borderRadius: BorderRadius.circular(widget.height / 2),
              ),
            ),
          ),
          // Tab options
          Row(
            children: List.generate(widget.options.length, (index) {
              bool isSelected = index == selectedIndex;
              return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  widget.onChanged(index);
                },
                child: Container(
                  // color: Colors.black,
                  alignment: Alignment.center,
                  // height: widget.height,
                  width: tabWidth/2,
                  // Make sure the area fills and responds
                  child: Text(
                    widget.options[index],
                    style: TextStyle(
                      color: isSelected
                          ? widget.selectedTextColor
                          : widget.unselectedTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              );

            }),
          ),
        ],
      ),
    );
  }
}
