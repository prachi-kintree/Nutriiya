import 'package:flutter/material.dart';

class CustomMediaModel {
  final Widget displayWidget;
  final String? filePath;
  String? imageLink;
  bool isSelected;
  bool? isVideo;
  String? mediaId;

  CustomMediaModel(
      {required this.displayWidget,
      required this.filePath,
      this.imageLink = "",
      this.mediaId = "",
      this.isVideo,
      this.isSelected = false});
}
