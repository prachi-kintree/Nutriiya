import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';

class VideoThumbnailWidget extends StatefulWidget {
  String videoUrl;
  double imageSize;
  bool isExpanded;

  VideoThumbnailWidget({
    required this.videoUrl,
    this.imageSize = 40,
    this.isExpanded = false,
  });

  @override
  State<VideoThumbnailWidget> createState() => _VideoThumbnailWidgetState();
}

class _VideoThumbnailWidgetState extends State<VideoThumbnailWidget> {
  late final Future getfile;

  Future<String> getThumbnail() async {
    final fileName = await VideoThumbnail.thumbnailFile(
      video: widget.videoUrl,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.PNG,
      maxWidth: 0,
      maxHeight: 0,
      // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
      quality: 75,
    );
    return fileName ?? "";
  }

  @override
  void initState() {
    getfile = getThumbnail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getfile,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              // margin: widget.isExpanded ? EdgeInsets.all(15.h) : null,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.r),
                color: ThemeManagerPlus.of<AppTheme>(context)
                    .currentTheme
                    .new_bg_pink_color,
              ),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Image.file(
                    File(snapshot.data),
                    fit: BoxFit.fill,
                  ),
                  Positioned.fill(
                      child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 40,
                          )))
                ],
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              color: Colors.grey[100],
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Text(
                  // "KINTREE",
                  "",
                  style: AppTextStyle.jakartaStyle(
                      withTextStyle: TextStyle(fontSize: 20.sp),
                      jakartaFont: JakartaStyle.bold),
                ),
              ),
            );
          }
        });
  }
}
