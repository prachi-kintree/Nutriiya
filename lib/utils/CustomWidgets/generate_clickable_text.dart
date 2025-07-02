import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../styles/app_text_styles.dart';

List<TextSpan> extractText({
  required String rawString,
  required Function(bool)? callBack,
  Color clickableItemColor = Colors.blue,
}) {
  List<TextSpan> textSpan = [];

  // Regular expression for detecting links
  final urlRegExp = RegExp(
    r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?",
  );

  // Regular expression for detecting hashtags
  final hashtagRegExp = RegExp(r'\B#\w+');

  getLink(String linkString) {
    textSpan.add(
      TextSpan(
        text: linkString,
        style: AppTextStyle.outfitStyle(
            withTextStyle: TextStyle(color: clickableItemColor, fontSize: 16.sp
                // Add your text style here for links
                ),
            outfitFont: OutfitFontStyle.regular),
        recognizer: TapGestureRecognizer()
          ..onTap = () async {
            // Handle the link tap event here
            await launchUrl(Uri.parse(linkString));
          },
      ),
    );
    return linkString;
  }

  getHashtag(String hashtag) {
    textSpan.add(
      TextSpan(
        text: hashtag,
        style: AppTextStyle.outfitStyle(
            withTextStyle: TextStyle(color: clickableItemColor, fontSize: 16.sp
                // Add your text style here for links
                ),
            outfitFont: OutfitFontStyle.regular),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            // Handle the hashtag tap event here
            print("Hashtag tapped: $hashtag");
          },
      ),
    );
    return hashtag;
  }

  getNormalText(String normalText) {
    textSpan.add(
      TextSpan(
        text: normalText,
        style: AppTextStyle.outfitStyle(
            withTextStyle: TextStyle(color: Color(0xFF777777), fontSize: 14.sp
                // Add your text style here for links
                ),
            outfitFont: OutfitFontStyle.regular),
      ),
    );
    return normalText;
  }

  rawString.splitMapJoin(
    urlRegExp,
    onMatch: (m) {
      if (callBack != null) {
        callBack(true);
      }
      // return getLink("${m.group(0)}");
      return "";
    },
    onNonMatch: (n) {
      return n.splitMapJoin(
        hashtagRegExp,
        onMatch: (match) => getHashtag(match.group(0)!),
        onNonMatch: (nonMatch) => getNormalText(nonMatch),
      );
    },
  );

  return textSpan;
}
