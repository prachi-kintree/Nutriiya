// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:nutriya/extension/extension_sized_box.dart';
// import 'package:nutriya/utils/styles/app_text_styles.dart';
// import 'package:nutriya/utils/theme/theme_model.dart';
// import 'package:nutriya/utils/utils.dart';
// import 'package:theme_manager_plus/theme_manager_plus.dart';

// class CommonSearchBar extends StatefulWidget {
//   const CommonSearchBar({super.key});

//   @override
//   State<CommonSearchBar> createState() => _CommonSearchBarState();
// }

// class _CommonSearchBarState extends State<CommonSearchBar> {
//   @override
//   Widget build(BuildContext context) {
//     return const SearchBar();
//  Container(
//   height: 51.h,
//   width: 1.sw,
//   decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(21.0.r),
//       color: Color(0xffE7E7E7)),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       20.sBW,
//       Icon(
//         CupertinoIcons.search,
//         size: 25.h,
//         color: const Color(0xff42A004),
//       ),
//       18.sBW,
//       Text(
//         "Search for food",
//         textAlign: TextAlign.start,
//         style: AppTextStyle.outfitStyle(
//             withTextStyle:
//                 TextStyle(fontSize: 18.sp, color: Color(0xff484C52)),
//             outfitFont: OutfitFontStyle.regular),
//       ),
//       const Spacer(),
//       SvgPicture.asset(svgCancel),
//       20.sBW,
//     ],
//   ),
// );
//   }
// }

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonSearchBar extends StatefulWidget {
  /// Creates a Material Design search bar.
  const CommonSearchBar({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.leading,
    this.trailing,
    this.onTap,
    this.onTapOutside,
    this.onChanged,
    this.onSubmitted,
    this.searchController,
    // this.constraints,
    // this.elevation,
    this.backgroundColor,
    // this.shadowColor,
    // this.surfaceTintColor,
    // this.overlayColor,
    // this.side,
    // this.shape,
    this.padding,
    this.textStyle,
    this.hintStyle,
    // this.textCapitalization,
    this.enabled = true,
    this.autoFocus = false,
    this.textInputAction,
    this.keyboardType,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.contextMenuBuilder = _defaultContextMenuBuilder,
  });

  final TextEditingController? controller;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  final String? hintText;

  final Widget? leading;

  final Iterable<Widget>? trailing;

  final SearchController? searchController;

  /// Called when the user taps this search bar.
  final GestureTapCallback? onTap;

  /// Called when the user taps outside the search bar.
  final TapRegionCallback? onTapOutside;

  /// Invoked upon user input.
  final ValueChanged<String>? onChanged;

  /// Called when the user indicates that they are done editing the text in the
  /// field.
  final ValueChanged<String>? onSubmitted;

  final MaterialStateProperty<Color?>? backgroundColor;

  final MaterialStateProperty<EdgeInsetsGeometry?>? padding;

  final MaterialStateProperty<TextStyle?>? textStyle;

  final MaterialStateProperty<TextStyle?>? hintStyle;

  final bool enabled;

  /// {@macro flutter.widgets.editableText.autofocus}
  final bool autoFocus;

  /// {@macro flutter.widgets.TextField.textInputAction}
  final TextInputAction? textInputAction;

  final TextInputType? keyboardType;

  /// {@macro flutter.widgets.editableText.scrollPadding}
  final EdgeInsets scrollPadding;

  final EditableTextContextMenuBuilder? contextMenuBuilder;

  static Widget _defaultContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    if (defaultTargetPlatform == TargetPlatform.iOS &&
        SystemContextMenu.isSupported(context)) {
      return SystemContextMenu.editableText(
          editableTextState: editableTextState);
    }
    return AdaptiveTextSelectionToolbar.editableText(
        editableTextState: editableTextState);
  }

  @override
  State<CommonSearchBar> createState() => _CommonSearchBarState();
}

class _CommonSearchBarState extends State<CommonSearchBar> {
  late final MaterialStatesController _internalStatesController;
  FocusNode? _internalFocusNode;
  FocusNode get _focusNode =>
      widget.focusNode ?? (_internalFocusNode ??= FocusNode());

  @override
  void initState() {
    super.initState();
    _internalStatesController = MaterialStatesController();
    _internalStatesController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _internalStatesController.dispose();
    _internalFocusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextDirection textDirection = Directionality.of(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final SearchBarThemeData searchBarTheme = SearchBarTheme.of(context);
    final SearchBarThemeData defaults = _SearchBarDefaultsM3(context);

    T? resolve<T>(
      MaterialStateProperty<T>? widgetValue,
      MaterialStateProperty<T>? themeValue,
      MaterialStateProperty<T>? defaultValue,
    ) {
      final Set<MaterialState> states = _internalStatesController.value;
      return widgetValue?.resolve(states) ??
          themeValue?.resolve(states) ??
          defaultValue?.resolve(states);
    }

    final TextStyle? effectiveTextStyle = resolve<TextStyle?>(
      widget.textStyle,
      searchBarTheme.textStyle,
      defaults.textStyle,
    );

    final Color? effectiveBackgroundColor = resolve<Color?>(
      widget.backgroundColor,
      searchBarTheme.backgroundColor,
      defaults.backgroundColor,
    );

    final EdgeInsetsGeometry? effectivePadding = resolve<EdgeInsetsGeometry?>(
      widget.padding,
      searchBarTheme.padding,
      defaults.padding,
    );

    final Set<MaterialState> states = _internalStatesController.value;
    final TextStyle? effectiveHintStyle = widget.hintStyle?.resolve(states) ??
        searchBarTheme.hintStyle?.resolve(states) ??
        widget.textStyle?.resolve(states) ??
        searchBarTheme.textStyle?.resolve(states) ??
        defaults.hintStyle?.resolve(states);

    final Color defaultColor = switch (colorScheme.brightness) {
      Brightness.light => kDefaultIconDarkColor,
      Brightness.dark => kDefaultIconLightColor,
    };
    final IconThemeData? customTheme = switch (IconTheme.of(context)) {
      final IconThemeData iconTheme when iconTheme.color != defaultColor =>
        iconTheme,
      _ => null,
    };

    Widget? leading;
    if (widget.leading != null) {
      leading = IconTheme.merge(
        data: customTheme ?? IconThemeData(color: colorScheme.onSurface),
        child: widget.leading!,
      );
    }

    final List<Widget>? trailing = widget.trailing
        ?.map(
          (Widget trailing) => IconTheme.merge(
            data: customTheme ??
                IconThemeData(color: colorScheme.onSurfaceVariant),
            child: trailing,
          ),
        )
        .toList();

    return Opacity(
      opacity: widget.enabled ? 1 : 0.38,
      child: Container(
        height: 51.h,
        width: 1.sw,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0.r),
            color: effectiveBackgroundColor),
        child: Padding(
          padding: effectivePadding!,
          child: Row(
            textDirection: textDirection,
            children: <Widget>[
              if (leading != null) leading,
              Expanded(
                child: Padding(
                  padding: effectivePadding,
                  child: Semantics(
                    inputType: SemanticsInputType.search,
                    child: TextField(
                      autofocus: widget.autoFocus,
                      onTap: widget.onTap,
                      onTapAlwaysCalled: true,
                      onTapOutside: widget.onTapOutside,
                      focusNode: _focusNode,
                      onChanged: widget.onChanged,
                      onSubmitted: widget.onSubmitted,
                      controller: widget.searchController,
                      style: effectiveTextStyle,
                      enabled: widget.enabled,
                      cursorColor: Colors.grey,

                      decoration: InputDecoration(hintText: widget.hintText)
                          .applyDefaults(
                        InputDecorationTheme(
                          hintStyle: effectiveHintStyle,
                          // The configuration below is to make sure that the text field
                          // in `SearchBar` will not be overridden by the overall `InputDecorationTheme`
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          // Setting `isDense` to true to allow the text field height to be
                          // smaller than 48.0
                          isDense: true,
                        ),
                      ),
                      // textCapitalization: effectiveTextCapitalization,
                      textInputAction: widget.textInputAction,
                      keyboardType: widget.keyboardType,
                      scrollPadding: widget.scrollPadding,
                      contextMenuBuilder: widget.contextMenuBuilder,
                    ),
                  ),
                ),
              ),
              ...?trailing,
            ],
          ),
        ),
      ),
    );
    //  ConstrainedBox(
    //   constraints: widget.constraints ??
    //       searchBarTheme.constraints ??
    //       defaults.constraints!,
    //   child: Opacity(
    //     opacity: widget.enabled ? 1 : 0.38,
    //     child: Material(
    //       elevation: effectiveElevation!,
    //       shadowColor: effectiveShadowColor,
    //       color: effectiveBackgroundColor,
    //       surfaceTintColor: effectiveSurfaceTintColor,
    //       shape: effectiveShape?.copyWith(side: effectiveSide),
    //       child: IgnorePointer(
    //         ignoring: !widget.enabled,
    //         child: InkWell(
    //           onTap: () {
    //             widget.onTap?.call();
    //             if (!_focusNode.hasFocus) {
    //               _focusNode.requestFocus();
    //             }
    //           },
    //           overlayColor: effectiveOverlayColor,
    //           customBorder: effectiveShape?.copyWith(side: effectiveSide),
    //           statesController: _internalStatesController,
    //           child: Padding(
    //             padding: effectivePadding!,
    //             child: Row(
    //               textDirection: textDirection,
    //               children: <Widget>[
    //                 if (leading != null) leading,
    //                 Expanded(
    //                   child: Padding(
    //                     padding: effectivePadding,
    //                     child: Semantics(
    //                       inputType: SemanticsInputType.search,
    //                       child: TextField(
    //                         autofocus: widget.autoFocus,
    //                         onTap: widget.onTap,
    //                         onTapAlwaysCalled: true,
    //                         onTapOutside: widget.onTapOutside,
    //                         focusNode: _focusNode,
    //                         onChanged: widget.onChanged,
    //                         onSubmitted: widget.onSubmitted,
    //                         controller: widget.controller,
    //                         style: effectiveTextStyle,
    //                         enabled: widget.enabled,
    //                         decoration:
    //                             InputDecoration(hintText: widget.hintText)
    //                                 .applyDefaults(
    //                           InputDecorationTheme(
    //                             hintStyle: effectiveHintStyle,
    //                             // The configuration below is to make sure that the text field
    //                             // in `SearchBar` will not be overridden by the overall `InputDecorationTheme`
    //                             enabledBorder: InputBorder.none,
    //                             border: InputBorder.none,
    //                             focusedBorder: InputBorder.none,
    //                             contentPadding: EdgeInsets.zero,
    //                             // Setting `isDense` to true to allow the text field height to be
    //                             // smaller than 48.0
    //                             isDense: true,
    //                           ),
    //                         ),
    //                         textCapitalization: effectiveTextCapitalization,
    //                         textInputAction: widget.textInputAction,
    //                         keyboardType: widget.keyboardType,
    //                         scrollPadding: widget.scrollPadding,
    //                         contextMenuBuilder: widget.contextMenuBuilder,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 ...?trailing,
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

class _SearchBarDefaultsM3 extends SearchBarThemeData {
  _SearchBarDefaultsM3(this.context);

  final BuildContext context;
  late final ColorScheme _colors = Theme.of(context).colorScheme;
  late final TextTheme _textTheme = Theme.of(context).textTheme;

  @override
  MaterialStateProperty<Color?>? get backgroundColor =>
      MaterialStatePropertyAll<Color>(_colors.surfaceContainerHigh);

  @override
  MaterialStateProperty<double>? get elevation =>
      const MaterialStatePropertyAll<double>(6.0);

  @override
  MaterialStateProperty<Color>? get shadowColor =>
      MaterialStatePropertyAll<Color>(_colors.shadow);

  @override
  MaterialStateProperty<Color>? get surfaceTintColor =>
      const MaterialStatePropertyAll<Color>(Colors.transparent);

  @override
  MaterialStateProperty<Color?>? get overlayColor =>
      MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return _colors.onSurface.withOpacity(0.1);
        }
        if (states.contains(MaterialState.hovered)) {
          return _colors.onSurface.withOpacity(0.08);
        }
        if (states.contains(MaterialState.focused)) {
          return Colors.transparent;
        }
        return Colors.transparent;
      });

  // No default side

  @override
  MaterialStateProperty<OutlinedBorder>? get shape =>
      const MaterialStatePropertyAll<OutlinedBorder>(StadiumBorder());

  @override
  MaterialStateProperty<EdgeInsetsGeometry>? get padding =>
      const MaterialStatePropertyAll<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(horizontal: 8.0));

  @override
  MaterialStateProperty<TextStyle?> get textStyle =>
      MaterialStatePropertyAll<TextStyle?>(
          _textTheme.bodyLarge?.copyWith(color: _colors.onSurface));

  @override
  MaterialStateProperty<TextStyle?> get hintStyle =>
      MaterialStatePropertyAll<TextStyle?>(
          _textTheme.bodyLarge?.copyWith(color: _colors.onSurfaceVariant));

  @override
  BoxConstraints get constraints =>
      const BoxConstraints(minWidth: 360.0, maxWidth: 800.0, minHeight: 56.0);

  @override
  TextCapitalization get textCapitalization => TextCapitalization.none;
}

class _SearchViewDefaultsM3 extends SearchViewThemeData {
  _SearchViewDefaultsM3(this.context, {required this.isFullScreen});

  final BuildContext context;
  final bool isFullScreen;
  late final ColorScheme _colors = Theme.of(context).colorScheme;
  late final TextTheme _textTheme = Theme.of(context).textTheme;

  static double fullScreenBarHeight = 72.0;

  @override
  Color? get backgroundColor => _colors.surfaceContainerHigh;

  @override
  double? get elevation => 6.0;

  @override
  Color? get surfaceTintColor => Colors.transparent;

  // No default side

  @override
  OutlinedBorder? get shape => isFullScreen
      ? const RoundedRectangleBorder()
      : const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(28.0)));

  @override
  TextStyle? get headerTextStyle =>
      _textTheme.bodyLarge?.copyWith(color: _colors.onSurface);

  @override
  TextStyle? get headerHintStyle =>
      _textTheme.bodyLarge?.copyWith(color: _colors.onSurfaceVariant);

  @override
  BoxConstraints get constraints =>
      const BoxConstraints(minWidth: 360.0, minHeight: 240.0);

  @override
  EdgeInsetsGeometry? get barPadding =>
      const EdgeInsets.symmetric(horizontal: 8.0);

  @override
  bool get shrinkWrap => false;

  @override
  Color? get dividerColor => _colors.outline;
}
