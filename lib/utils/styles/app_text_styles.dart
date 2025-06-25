import 'package:flutter/material.dart';

enum BarlowFontStyle { light, regular, italic, medium, semibold, bold }

enum FigTreeFontStyle { light, regular, italic, medium, semibold, bold }

enum LufgaFontStyle { light, regular, italic, medium, semibold, bold }

enum OutfitFontStyle { light, regular, medium, semibold, bold }

enum JakartaStyle { light, regular, italic, medium, semibold, bold }

class AppTextStyle {
  AppTextStyle._();

  static TextStyle lufgaStyle(
      {required TextStyle withTextStyle, required LufgaFontStyle lufgaFont}) {
    switch (lufgaFont) {
      case LufgaFontStyle.light:
        return withTextStyle.copyWith(
            fontFamily: "Lufga", fontWeight: FontWeight.w300);
      case LufgaFontStyle.regular:
        return withTextStyle.copyWith(
            fontFamily: "Lufga", fontWeight: FontWeight.w400);
      case LufgaFontStyle.italic:
        return withTextStyle.copyWith(
            fontFamily: "Lufga",
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic);
      case LufgaFontStyle.medium:
        return withTextStyle.copyWith(
            fontFamily: "Lufga", fontWeight: FontWeight.w500);
      case LufgaFontStyle.semibold:
        return withTextStyle.copyWith(
            fontFamily: "Lufga", fontWeight: FontWeight.w600);
      case LufgaFontStyle.bold:
        return withTextStyle.copyWith(
            fontFamily: "Lufga", fontWeight: FontWeight.w700);
      default:
        return withTextStyle;
    }
  }

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
      default:
        return withTextStyle;
    }
  }

  static TextStyle jakartaStyle(
      {required TextStyle withTextStyle, required JakartaStyle jakartaFont}) {
    switch (jakartaFont) {
      case JakartaStyle.light:
        return withTextStyle.copyWith(
            fontFamily: "PlusJakartaSans", fontWeight: FontWeight.w300);
      case JakartaStyle.regular:
        return withTextStyle.copyWith(
            fontFamily: "PlusJakartaSans", fontWeight: FontWeight.w400);
      case JakartaStyle.italic:
        return withTextStyle.copyWith(
            fontFamily: "PlusJakartaSans",
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic);
      case JakartaStyle.medium:
        return withTextStyle.copyWith(
            fontFamily: "PlusJakartaSans", fontWeight: FontWeight.w500);
      case JakartaStyle.semibold:
        return withTextStyle.copyWith(
            fontFamily: "PlusJakartaSans", fontWeight: FontWeight.w600);
      case JakartaStyle.bold:
        return withTextStyle.copyWith(
            fontFamily: "PlusJakartaSans", fontWeight: FontWeight.w700);
      default:
        return withTextStyle;
    }
  }
}
