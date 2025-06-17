// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:kintree/RouteManager/route_manager_barrel.dart';
// import 'package:kintree/translation/locale_keys.g.dart';
// import 'package:kintree/utils/CustomWidgets/AppBar/app_bar.dart';
// import 'package:kintree/utils/ImageManager/media_model.dart';
// import 'package:kintree/utils/app_string/app_string_barrel.dart';
// import 'package:kintree/utils/styles/app_decoration.dart';
// import 'package:kintree/utils/styles/app_text_styles.dart';
// import 'package:kintree/utils/theme/theme_barrel.dart';
// import 'package:photo_manager/photo_manager.dart';

// class MediaGrid extends StatefulWidget {
//   bool showOnlyImages;
//   int maxMultiSelection;
//   MediaGrid({this.showOnlyImages = false, this.maxMultiSelection = 10000});

//   @override
//   _MediaGridState createState() => _MediaGridState();
// }

// class _MediaGridState extends State<MediaGrid> {
//   List<CustomMediaModel> _mediaList = [];
//   List<CustomMediaModel> userselectedMedia = [];
//   int currentPage = 0;
//   int lastPage = 100000;
//   @override
//   void initState() {
//     super.initState();
//     _fetchNewMedia();
//   }

//   _handleScrollEvent(ScrollNotification scroll) {
//     if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
//       if (currentPage != lastPage) {
//         _fetchNewMedia();
//       }
//     }
//   }

//   _fetchNewMedia() async {
//     lastPage = currentPage;
//     var result = await PhotoManager.requestPermissionExtend(
//         requestOption: PermissionRequestOption());
//     if (result.isAuth) {
//       // success
// //load the album list
//       List<AssetPathEntity> albums =
//           await PhotoManager.getAssetPathList(onlyAll: true);
//       print(albums);
//       List<AssetEntity> media =
//           await albums[0].getAssetListPaged(page: 0, size: 100000);
//       print(await media[0].relativePath);
//       if (widget.showOnlyImages) {
//         media = media.where((e) => e.type == AssetType.image).toList();
//       }
//       List<CustomMediaModel> temp = [];
//       for (var asset in media) {
//         temp.add(CustomMediaModel(
//             displayWidget: FutureBuilder(
//               future: asset.thumbnailDataWithSize(ThumbnailSize(200, 200)),
//               builder: (BuildContext context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   return Stack(
//                     children: <Widget>[
//                       Positioned.fill(
//                         child: Container(
//                           child: Image.memory(
//                             snapshot.data!,
//                             fit: BoxFit.cover,
//                             filterQuality: FilterQuality.high,
//                           ),
//                         ),
//                       ),
//                       if (asset.type == AssetType.video)
//                         Align(
//                           alignment: Alignment.bottomRight,
//                           child: Padding(
//                             padding: EdgeInsets.only(right: 5, bottom: 5),
//                             child: Icon(
//                               Icons.videocam,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                     ],
//                   );
//                 } else {
//                   return Container(
//                     child: Center(child: CircularProgressIndicator()),
//                   );
//                 }
//               },
//             ),
//             filePath: asset));
//       }
//       setState(() {
//         _mediaList.addAll(temp);
//         currentPage++;
//       });
//     } else {
//       PhotoManager.openSetting();
//       // fail
//       /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
//     }
//   }

//   selectedMedia(CustomMediaModel item) {
//     print(item.filePath);

//     if (userselectedMedia.indexWhere(
//             (element) => element.filePath?.id == item.filePath?.id) !=
//         -1) {
//       int index = userselectedMedia
//           .indexWhere((element) => element.filePath?.id == item.filePath?.id);
//       userselectedMedia.removeAt(index);
//     } else {
//       userselectedMedia.add(item);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return NotificationListener<ScrollNotification>(
//       onNotification: (ScrollNotification scroll) {
//         _handleScrollEvent(scroll);
//         return true;
//       },
//       child: Scaffold(
//         appBar: CustomAppBar(
//           appBarTitle: "Select Media",
//           elevation: 2,
//           backgroundColor:  ThemeManagerPlus.of<AppTheme>(context).currentTheme.white,
//           actions: [
//             InkWell(
//               onTap: () {
//                 appNavigator.maybePop(userselectedMedia);
//               },
//               child: Padding(
//                 padding: EdgeInsetsDirectional.only(end: 10.w),
//                 child: Center(
//                   child: Text(
//                     LocaleKeys.general_save_button.tr(),
//                     style: AppTextStyle.figTreeStyle(
//                         withTextStyle:
//                             TextStyle(color:  ThemeManagerPlus.of<AppTheme>(context).currentTheme.button_color),
//                         figTreeFont: FigTreeFontStyle.medium),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//         body: GridView.builder(
//             itemCount: _mediaList.length,
//             gridDelegate:
//                 SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//             itemBuilder: (BuildContext context, int index) {
//               return InkWell(
//                   onTap: () {
//                     if (userselectedMedia.length < widget.maxMultiSelection) {
//                       setState(() {
//                         _mediaList[index].isSelected =
//                             !_mediaList[index].isSelected;
//                         selectedMedia(_mediaList[index]);
//                       });
//                     } else {
//                       AppDecoration.showToast(
//                           message:
//                               "Max ${widget.maxMultiSelection} attachment can be selected ");
//                     }
//                   },
//                   child: Stack(
//                     children: [
//                       _mediaList[index].displayWidget,
//                       if (_mediaList[index].isSelected) ...[
//                         Align(
//                           alignment: Alignment.topRight,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: SvgPicture.asset(
//                               svgTick,
//                               height: 20.h,
//                             ),
//                           ),
//                         )
//                       ]
//                     ],
//                   ));
//             }),
//       ),
//     );
//   }
// }
