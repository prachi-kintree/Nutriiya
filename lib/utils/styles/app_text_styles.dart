import 'package:flutter/material.dart';



enum LufgaFontStyle { light, regular, italic, medium, semibold, bold }

enum OutfitFontStyle { light, regular, medium, semibold, bold }

// enum JakartaStyle { light, regular, italic, medium, semibold, bold }

class AppTextStyle {
  AppTextStyle._();

  static TextStyle outfitStyle(
      {required TextStyle withTextStyle,
      TextDecoration? textDecoration,
      required OutfitFontStyle outfitFont}) {
    switch (outfitFont) {
      case OutfitFontStyle.light:
        return withTextStyle.copyWith(
            decoration: textDecoration,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w300);
      case OutfitFontStyle.regular:
        return withTextStyle.copyWith(
            decoration: textDecoration,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w400);
      case OutfitFontStyle.medium:
        return withTextStyle.copyWith(
            decoration: textDecoration,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w500);
      case OutfitFontStyle.semibold:
        return withTextStyle.copyWith(
            decoration: textDecoration,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w600);
      case OutfitFontStyle.bold:
        return withTextStyle.copyWith(
            decoration: textDecoration,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w700);
      }
  }

}
