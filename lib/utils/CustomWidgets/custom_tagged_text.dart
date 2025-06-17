import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

Widget generateRichText(
    String fullName,
    // List<AttendeesModel> checkedListMemberList,
    {int photoCount = 0,
    String albumName = "",
    bool isForBrand = false,
    // Posts? postData
    }) {
  // print("Feeling ---? ${postData?.authorDetails?.firstName}");

  // Check if the list has attendees
  double fontSize = 13.5.sp;
  // FigTreeFontStyle fontStyle = FigTreeFontStyle.medium;
  // String userFeeling = postData?.postData?.feeling?.name ?? "";

  Widget feeling = CachedNetworkImage(
    imageUrl: "postData?.postData?.feeling?.imageUrl ?? """,
    imageBuilder: (context, imageProvider) =>
        Container(
          width: 15.w,
          height: 15.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.w),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
    placeholder: (context, url) =>
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 15.h,
            width: 15.w,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
    errorWidget: (context, url, error) =>
        Container(
          width: 15.w,
          height: 15.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.w),
            color: Colors.grey.shade200,
          ),
          child: Icon(Icons.error, size: 20.w),
        ),
  );

  // SvgPicture.network(
  //   postData?.postData?.feeling?.imageUrl ?? "",
  //   width: 15.w,
  //   height: 15.w,
  //   fit: BoxFit.scaleDown,
  // );
  // if (checkedListMemberList.isNotEmpty) {
  //   print(
  //       "Feeling ---? ${postData?.authorDetails?.firstName} ${postData?.postData?.feeling?.name}");
  //
  //   List<InlineSpan> textSpans = [];
  //   // String userFeeling = postData?.feelingUrl ?? "";
  //   // Widget feeling = SvgPicture.asset(
  //   //   appNavigator.navigationContext!
  //   //       .read<FeelingViewModel>()
  //   //       .getImagefromFeelingId(feelingId: postData?.feelingId ?? ""),
  //   //   fit: BoxFit.scaleDown,
  //   // );
  //   // Build the message based on the number of attendees
  //   if (checkedListMemberList.length == 1) {
  //     if ((postData?.postData?.feeling?.imageUrl ?? "").isNotEmpty) {
  //       textSpans.add(TextSpan(
  //           text: "${fullName.trim()}",
  //           style: AppTextStyle.figTreeStyle(
  //               withTextStyle:
  //                   TextStyle(color: Colors.black, fontSize: fontSize),
  //               figTreeFont: FigTreeFontStyle.bold)));
  //       if (isForBrand) {
  //         textSpans.add(WidgetSpan(child: 5.sBW));
  //         textSpans.add(WidgetSpan(
  //             child: Icon(
  //           Icons.check_circle,
  //           color: Color(0xFF943F7F),
  //           size: 15,
  //         )));
  //       }
  //       textSpans.add(TextSpan(
  //         text: " is ",
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(
  //               fontSize: fontSize,
  //               color: Color(0xFF656564),
  //             ),
  //             figTreeFont: fontStyle),
  //       ));
  //       textSpans.add(WidgetSpan(child: feeling));
  //       textSpans.add(TextSpan(
  //         text: " feeling",
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(
  //               fontSize: fontSize,
  //               color: Color(0xFF656564),
  //             ),
  //             figTreeFont: fontStyle),
  //       ));
  //       textSpans.add(TextSpan(
  //         text: userFeeling,
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(
  //               fontSize: fontSize,
  //               color: Color(0xFF656564),
  //             ),
  //             figTreeFont: FigTreeFontStyle.bold),
  //       ));
  //       textSpans.add(TextSpan(
  //         text: " with  ",
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(
  //               fontSize: fontSize,
  //               color: Color(0xFF656564),
  //             ),
  //             figTreeFont: fontStyle),
  //       ));
  //     } else {
  //       textSpans.add(TextSpan(
  //           text: "${fullName.trim()}",
  //           style: AppTextStyle.figTreeStyle(
  //               withTextStyle:
  //                   TextStyle(color: Colors.black, fontSize: fontSize),
  //               figTreeFont: FigTreeFontStyle.bold)));
  //       if (isForBrand) {
  //         textSpans.add(WidgetSpan(child: 5.sBW));
  //         textSpans.add(WidgetSpan(
  //             child: Icon(
  //           Icons.check_circle,
  //           color: Color(0xFF943F7F),
  //           size: 15,
  //         )));
  //       }
  //       textSpans.add(TextSpan(
  //           text: " is with ",
  //           style: AppTextStyle.figTreeStyle(
  //               withTextStyle:
  //                   TextStyle(color: Colors.black, fontSize: fontSize),
  //               figTreeFont: FigTreeFontStyle.bold)));
  //     }
  //
  //     textSpans.add(TextSpan(
  //       text: checkedListMemberList[0].attendeeName!.trim(),
  //       style: AppTextStyle.figTreeStyle(
  //           withTextStyle: TextStyle(
  //             decoration: TextDecoration.underline,
  //             fontSize: fontSize,
  //             color: Color(0xFF656564),
  //           ),
  //           figTreeFont: fontStyle),
  //     ));
  //   } else if (checkedListMemberList.length == 2) {
  //     if ((postData?.postData?.feeling?.imageUrl ?? "").isNotEmpty) {
  //       textSpans.add(TextSpan(
  //           text: "${fullName.trim()}",
  //           style: AppTextStyle.figTreeStyle(
  //               withTextStyle:
  //                   TextStyle(color: Colors.black, fontSize: fontSize),
  //               figTreeFont: FigTreeFontStyle.bold)));
  //       if (isForBrand) {
  //         textSpans.add(WidgetSpan(child: 5.sBW));
  //         textSpans.add(WidgetSpan(
  //             child: Icon(
  //           Icons.check_circle,
  //           color: Color(0xFF943F7F),
  //           size: 15,
  //         )));
  //       }
  //       textSpans.add(TextSpan(
  //         text: " is ",
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(
  //               fontSize: fontSize,
  //               color: Color(0xFF656564),
  //             ),
  //             figTreeFont: fontStyle),
  //       ));
  //       textSpans.add(WidgetSpan(child: feeling));
  //       textSpans.add(TextSpan(
  //         text: " feeling",
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(
  //               fontSize: fontSize,
  //               color: Color(0xFF656564),
  //             ),
  //             figTreeFont: fontStyle),
  //       ));
  //       textSpans.add(TextSpan(
  //         text: userFeeling,
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(
  //               fontSize: fontSize,
  //               color: Color(0xFF656564),
  //             ),
  //             figTreeFont: FigTreeFontStyle.bold),
  //       ));
  //       textSpans.add(TextSpan(
  //         text: " with ",
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(
  //               fontSize: fontSize,
  //               color: Color(0xFF656564),
  //             ),
  //             figTreeFont: fontStyle),
  //       ));
  //     } else {
  //       textSpans.add(
  //         TextSpan(
  //             text: "${fullName.trim()}",
  //             style: AppTextStyle.figTreeStyle(
  //                 withTextStyle: TextStyle(
  //                   decoration: TextDecoration.underline,
  //                   color: Colors.black,
  //                   fontSize: fontSize,
  //                 ),
  //                 figTreeFont: FigTreeFontStyle.bold)),
  //       );
  //       if (isForBrand) {
  //         textSpans.add(WidgetSpan(child: 5.sBW));
  //         textSpans.add(WidgetSpan(
  //             child: Icon(
  //           Icons.check_circle,
  //           color: Color(0xFF943F7F),
  //           size: 15,
  //         )));
  //       }
  //       textSpans.add(
  //         TextSpan(
  //             text: " is with ",
  //             style: AppTextStyle.figTreeStyle(
  //                 withTextStyle: TextStyle(
  //                   decoration: TextDecoration.underline,
  //                   color: Colors.black,
  //                   fontSize: fontSize,
  //                 ),
  //                 figTreeFont: FigTreeFontStyle.bold)),
  //       );
  //     }
  //
  //     textSpans.add(TextSpan(
  //       text: checkedListMemberList[0].attendeeName!.trim(),
  //       style: AppTextStyle.figTreeStyle(
  //           withTextStyle: TextStyle(
  //             decoration: TextDecoration.underline,
  //             color: Color(0xFF656564),
  //             fontSize: fontSize,
  //           ),
  //           figTreeFont: fontStyle),
  //     ));
  //     textSpans.add(TextSpan(
  //         text: " and ",
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(
  //               decoration: TextDecoration.underline,
  //               color: Color(0xFF656564),
  //               fontSize: fontSize,
  //             ),
  //             figTreeFont: fontStyle)));
  //     textSpans.add(TextSpan(
  //       text: checkedListMemberList[1].attendeeName!.trim(),
  //       style: AppTextStyle.figTreeStyle(
  //           withTextStyle: TextStyle(
  //             decoration: TextDecoration.underline,
  //             color: Color(0xFF656564),
  //             fontSize: fontSize,
  //           ),
  //           figTreeFont: fontStyle),
  //     ));
  //   } else {
  //     if ((postData?.postData?.feeling?.imageUrl ?? "").isNotEmpty) {
  //       textSpans.add(TextSpan(
  //           text: "${fullName.trim()}",
  //           style: AppTextStyle.figTreeStyle(
  //               withTextStyle:
  //                   TextStyle(color: Colors.black, fontSize: fontSize),
  //               figTreeFont: FigTreeFontStyle.bold)));
  //       if (isForBrand) {
  //         textSpans.add(WidgetSpan(child: 5.sBW));
  //         textSpans.add(WidgetSpan(
  //             child: Icon(
  //           Icons.check_circle,
  //           color: Color(0xFF943F7F),
  //           size: 15,
  //         )));
  //       }
  //       textSpans.add(TextSpan(
  //         text: " is ",
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(
  //               fontSize: fontSize,
  //               color: Color(0xFF656564),
  //             ),
  //             figTreeFont: fontStyle),
  //       ));
  //       textSpans.add(WidgetSpan(child: feeling));
  //       textSpans.add(TextSpan(
  //         text: " feeling",
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(
  //               fontSize: fontSize,
  //               color: Color(0xFF656564),
  //             ),
  //             figTreeFont: fontStyle),
  //       ));
  //       textSpans.add(TextSpan(
  //         text: userFeeling,
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(
  //               fontSize: fontSize,
  //               color: Color(0xFF656564),
  //             ),
  //             figTreeFont: FigTreeFontStyle.bold),
  //       ));
  //       textSpans.add(TextSpan(
  //         text: " with ",
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(
  //               fontSize: fontSize,
  //               color: Color(0xFF656564),
  //             ),
  //             figTreeFont: fontStyle),
  //       ));
  //     } else {
  //       textSpans.add(TextSpan(
  //           text: "${fullName.trim()}",
  //           style: AppTextStyle.figTreeStyle(
  //               withTextStyle: TextStyle(
  //                 color: Colors.black,
  //                 fontSize: fontSize,
  //               ),
  //               figTreeFont: FigTreeFontStyle.bold)));
  //       if (isForBrand) {
  //         textSpans.add(WidgetSpan(child: 5.sBW));
  //         textSpans.add(WidgetSpan(
  //             child: Icon(
  //           Icons.check_circle,
  //           color: Color(0xFF943F7F),
  //           size: 15,
  //         )));
  //       }
  //     }
  //
  //     textSpans.add(TextSpan(
  //         text: " is with ",
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(
  //               color: Color(0xFF656564),
  //               fontSize: fontSize,
  //             ),
  //             figTreeFont: fontStyle)));
  //     textSpans.add(TextSpan(
  //       text: checkedListMemberList[0].attendeeName!.trim(),
  //       style: AppTextStyle.figTreeStyle(
  //           withTextStyle: TextStyle(
  //             decoration: TextDecoration.underline,
  //             color: Color(0xFF656564),
  //             fontSize: fontSize,
  //           ),
  //           figTreeFont: fontStyle),
  //     ));
  //     textSpans.add(TextSpan(
  //         text: ", ",
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(
  //               decoration: TextDecoration.underline,
  //               color: Color(0xFF656564),
  //               fontSize: fontSize,
  //             ),
  //             figTreeFont: fontStyle)));
  //     textSpans.add(TextSpan(
  //       text: checkedListMemberList[1].attendeeName!.trim(),
  //       style: AppTextStyle.figTreeStyle(
  //           withTextStyle: TextStyle(
  //             decoration: TextDecoration.underline,
  //             color: Color(0xFF656564),
  //             fontSize: fontSize,
  //           ),
  //           figTreeFont: fontStyle),
  //     ));
  //     textSpans.add(TextSpan(
  //         text: " and  ",
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(
  //               decoration: TextDecoration.underline,
  //               color: Color(0xFF656564),
  //               fontSize: fontSize,
  //             ),
  //             figTreeFont: FigTreeFontStyle.bold)));
  //     textSpans.add(TextSpan(
  //       text: "${checkedListMemberList.length - 2} others",
  //       style: AppTextStyle.figTreeStyle(
  //           withTextStyle: TextStyle(
  //             decoration: TextDecoration.underline,
  //             color: Color(0xFF656564),
  //             fontSize: fontSize,
  //           ),
  //           figTreeFont: fontStyle),
  //     ));
  //   }
  //   if (albumName.isNotEmpty) {
  //     textSpans.add(TextSpan(
  //       text: photoCount <= 0
  //           ? ""
  //           : " posted ${photoCount} ${photoCount > 1 ? LocaleKeys.photos.tr() : "Photo"} in the album ",
  //       style: AppTextStyle.figTreeStyle(
  //           withTextStyle: TextStyle(
  //             color: Color(0xFF656564),
  //             fontSize: fontSize,
  //           ),
  //           figTreeFont: fontStyle),
  //     ));
  //     textSpans.add(TextSpan(
  //       text: photoCount <= 0 ? "" : "$albumName",
  //       style: AppTextStyle.figTreeStyle(
  //           withTextStyle: TextStyle(
  //             color: Color(0xFF656564),
  //             fontSize: fontSize,
  //           ),
  //           figTreeFont: FigTreeFontStyle.bold),
  //     ));
  //   }
  //
  //   // Build the RichText widget
  //   RichText richText = RichText(
  //     text: TextSpan(
  //       children: textSpans,
  //     ),
  //   );
  //
  //   // Print the result
  //   return InkWell(
  //       onTap: () {
  //         List<FamilyMember> taggedMembers = checkedListMemberList
  //             .map((e) => FamilyMember(
  //                   userId: e.attendeeId,
  //                   image: e.attendeeImage,
  //                   relationName: e.attendeeRelation,
  //                   firstName: e.attendeeName,
  //                 ))
  //             .toList();
  //         Navigator.push(
  //           appNavigator.navigationContext!,
  //           MaterialPageRoute(
  //             builder: (_) => AllMemberPage(
  //               isPublic: postData?.privacy == 1,
  //               members: taggedMembers
  //                   .map((e) => TreeMember(
  //                       firstName: e.firstName,
  //                       lastName: e.lastName,
  //                       profilePicUrl: e.image,
  //                       relation: e.relationName,
  //                       id: int.parse(e.userId ?? "0")))
  //                   .toList(),
  //               title: LocaleKeys.tagged_member.tr(),
  //               isFromViewMember: true,
  //             ),
  //           ),
  //         );
  //       },
  //       child: richText);
  // } else if (albumName.isNotEmpty) {
  //   print(
  //       "Feeling ---?? ${postData?.authorDetails?.firstName} ${postData?.postData?.feeling?.name}");
  //
  //   List<InlineSpan> textSpans = [];
  //   if (albumName.isNotEmpty) {
  //     textSpans.add(TextSpan(
  //         text: "${fullName.trim()}",
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(color: Colors.black, fontSize: fontSize),
  //             figTreeFont: FigTreeFontStyle.semibold)));
  //     if (isForBrand) {
  //       textSpans.add(WidgetSpan(child: 5.sBW));
  //       textSpans.add(WidgetSpan(
  //           child: Icon(
  //         Icons.check_circle,
  //         color: Color(0xFF943F7F),
  //         size: 15,
  //       )));
  //     }
  //     if ((postData?.postData?.feeling?.imageUrl ?? "").isNotEmpty) {
  //       textSpans.add(TextSpan(
  //         text: " is ",
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(
  //               fontSize: fontSize,
  //               color: Color(0xFF656564),
  //             ),
  //             figTreeFont: fontStyle),
  //       ));
  //       textSpans.add(WidgetSpan(child: feeling));
  //       textSpans.add(TextSpan(
  //         text: " feeling",
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(
  //               fontSize: fontSize,
  //               color: Color(0xFF656564),
  //             ),
  //             figTreeFont: fontStyle),
  //       ));
  //
  //       textSpans.add(TextSpan(
  //         text: " ${userFeeling}",
  //         style: AppTextStyle.figTreeStyle(
  //             withTextStyle: TextStyle(
  //               fontSize: fontSize,
  //               color: Color(0xFF656564),
  //             ),
  //             figTreeFont: FigTreeFontStyle.bold),
  //       ));
  //     }
  //
  //     textSpans.add(TextSpan(
  //       text: photoCount <= 0
  //           ? ""
  //           : " ${userFeeling != "" ? "- " : ""}posted ${photoCount} ${photoCount > 1 ? "photos" : "photo"} in the album ",
  //       style: AppTextStyle.figTreeStyle(
  //           withTextStyle: TextStyle(
  //             color: Color(0xFF656564),
  //             fontSize: fontSize,
  //           ),
  //           figTreeFont: fontStyle),
  //     ));
  //     textSpans.add(TextSpan(
  //       text: photoCount <= 0 ? "" : "$albumName",
  //       style: AppTextStyle.figTreeStyle(
  //           withTextStyle: TextStyle(
  //             color: Color(0xFF656564),
  //             fontSize: fontSize,
  //           ),
  //           figTreeFont: FigTreeFontStyle.bold),
  //     ));
  //   }

  // if (isForBrand) {
  //   textSpans.add(WidgetSpan(
  //     child: Icon(
  //       Icons.check_circle,
  //       color: getTheme(appNavigator.navigationContext!).button_color,
  //       size: 15,
  //     ),
  //   ));
  // }
  // Build the RichText widget
  RichText richText = RichText(
    text: TextSpan(
      children: [
        // textSpans
      ],
    ),
  );

  return richText;
//   } else {
//     print(
//         "Feeling ---??? ${postData?.authorDetails?.firstName} ${postData?.postData?.feeling?.name}");
//     List<InlineSpan> textSpans = [];
//     textSpans.add(TextSpan(
//         text: "${fullName.trim()}",
//         style: AppTextStyle.figTreeStyle(
//             withTextStyle: TextStyle(color: Colors.black, fontSize: fontSize),
//             figTreeFont: FigTreeFontStyle.bold)));
//     if (isForBrand) {
//       textSpans.add(WidgetSpan(child: 5.sBW));
//       textSpans.add(WidgetSpan(
//           child: Icon(
//         Icons.check_circle,
//         color: Color(0xFF943F7F),
//         size: 15,
//       )));
//     }
//     if ((postData?.postData?.feeling?.imageUrl ?? "").isNotEmpty) {
//       textSpans.add(TextSpan(
//         text: " is ",
//         style: AppTextStyle.figTreeStyle(
//             withTextStyle: TextStyle(
//               fontSize: fontSize,
//               color: Color(0xFF656564),
//             ),
//             figTreeFont: fontStyle),
//       ));
//       textSpans.add(WidgetSpan(child: feeling));
//       textSpans.add(TextSpan(
//         text: " feeling",
//         style: AppTextStyle.figTreeStyle(
//             withTextStyle: TextStyle(
//               fontSize: fontSize,
//               color: Color(0xFF656564),
//             ),
//             figTreeFont: fontStyle),
//       ));
//       textSpans.add(TextSpan(
//         text: " ${userFeeling} ",
//         style: AppTextStyle.figTreeStyle(
//             withTextStyle: TextStyle(
//               fontSize: fontSize,
//               color: Color(0xFF656564),
//             ),
//             figTreeFont: FigTreeFontStyle.bold),
//       ));
//     }
//     RichText richText = RichText(
//       text: TextSpan(
//         children: textSpans,
//       ),
//     );
//     return richText;
//   }
// }
}