import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutriya/extension/extension_sized_box.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';

class ProfileImageSelectionWidget extends StatefulWidget {
  const ProfileImageSelectionWidget({super.key});

  @override
  State<ProfileImageSelectionWidget> createState() =>
      _ProfileImageSelectionWidgetState();
}

class _ProfileImageSelectionWidgetState
    extends State<ProfileImageSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.sBH,
        Text(
          'Choose a picture',
          textAlign: TextAlign.center,
          style: AppTextStyle.jakartaStyle(
            withTextStyle: TextStyle(
                color:
                    ThemeManagerPlus.of<AppTheme>(context).currentTheme.black,
                fontSize: 24.sp),
            jakartaFont: JakartaStyle.semibold,
          ),
        ),
        // 38.sBW,

        12.sBH,
        Text(
          '(Upload your image or select from below avatars for your profile picture)',
          textAlign: TextAlign.center,
          style: AppTextStyle.jakartaStyle(
            withTextStyle: TextStyle(
                color:
                    ThemeManagerPlus.of<AppTheme>(context).currentTheme.black,
                fontSize: 12.sp),
            jakartaFont: JakartaStyle.regular,
          ),
        ),

        20.sBH,

              SizedBox(
              child: Stack(
                children: [
                  Container(
                    height: 100.h,
                    width: 100.h,
                    decoration: BoxDecoration(
                      // color: Color(0xFFB396CB),
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFFB396CB)),
                    ),
                    // child: value.userImage == ''
                    //     ? Icon(
                    //         CupertinoIcons.person_solid,
                    //         color: Color(0xFFB396CB),
                    //         size: 70.h,
                    //       )
                    //     : ClipRRect(
                    //         borderRadius: BorderRadius.circular(60.0.r),
                    //         child: value.isAvatar
                    //             ? CachedNetworkImage(
                    //           imageUrl: value.userImage,
                    //           imageBuilder: (context, imageProvider) => Container(
                    //             decoration: BoxDecoration(
                    //               // borderRadius: BorderRadius.circular(40.w),
                    //               image: DecorationImage(
                    //                 image: imageProvider,
                    //                 fit: BoxFit.cover,
                    //               ),
                    //             ),
                    //           ),
                    //           placeholder: (context, url) => SvgPicture.asset(
                    //             svgProfileImage,
                    //             width: 40.w,
                    //             height: 40.w,
                    //             fit: BoxFit.scaleDown,
                    //           ),
                    //           errorWidget: (context, url, error) => Icon(Icons.error),
                    //         )
                    //         // Image.network(
                    //         //         value.userImage,
                    //         //         fit: BoxFit.contain,
                    //         //       )
                    //             : Image.file(
                    //                 File(value.userImage),
                    //                 fit: BoxFit.cover,
                    //               )),
                  ),
                  // value.userImage == ''
                  //     ? 0.sBH
                  //     : Positioned(
                  //         top: 10,
                  //         right: 8,
                  //         child: InkWell(
                  //           onTap: () {
                  //             value.resetImage();
                  //           },
                  //           child: Container(
                  //             height: 20.h,
                  //             width: 20.h,
                  //             decoration: BoxDecoration(
                  //                 border: Border.all(color: Color(0xFFB396CB)),
                  //                 shape: BoxShape.circle,
                  //                 color: Colors.white),
                  //             child: Icon(
                  //               CupertinoIcons.clear,
                  //               // Icons.edit,
                  //               // Icons.highlight_remove,
                  //               size: 12.h,
                  //               color: Color(0xFFB396CB),
                  //             ),
                  //           ),
                  //         ),
                  //       )
                ],
              ),
            ),
        20.sBH,

              Container(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                // itemCount: value.avatarImages.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3.2 / 2,
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 0.w),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return InkWell(
                      onTap: () {
                        // value.openCamera();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFB396CB),
                        ),
                        child: Icon(
                          CupertinoIcons.camera,
                          color: Colors.white,
                          size: 25.h,
                        ),
                      ),
                    );
                  } else if (index == 1) {
                    return InkWell(
                      onTap: () async {
                        // if(Platform.isAndroid && await Permission.storage.isDenied) {
                        //   await Permission.storage.request().then((val) => val.isGranted ? value.openGallery() : null);
                        // } else if(Platform.isIOS && await Permission.photos.isDenied) {
                        // await Permission.photos.request().then((val) => val.isGranted ? value.openGallery() : null);
                        // }
                        // print("Permission -- ${await Permission.storage.isDenied}");

                        // checkAndRequestPermission(value);
                        // if (status.isGranted) {
                        //   //
                        // }
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFB396CB),
                          ),
                          child: Icon(
                            CupertinoIcons.photo_fill_on_rectangle_fill,
                            color: Colors.white,
                            size: 25.h,
                          )),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      // value.setImageFromAvatar(value.avatarImages[index].url!,
                      //     value.avatarImages[index].id!);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(60.0.r),
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Color(0xFFB396CB)),
                          image: DecorationImage(
                              image: NetworkImage( ""
                                // value.avatarImages[index].url!,
                              ),
                              fit: BoxFit.contain)),
                    ),
                  );
                },
              ),
            ),
        70.sBH,
        InkWell(
          onTap: () {
            // context.read<UserBasicDetailViewModel>().validateDetailsAndAddData(
            //     startLoading: () {}, stopLoading: () {}, context: context);
          },
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Skip',
              textAlign: TextAlign.right,
              style: AppTextStyle.jakartaStyle(
                withTextStyle: TextStyle(
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .purple_500,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid,
                    fontSize: 15.sp),
                jakartaFont: JakartaStyle.medium,
              ),
            ),
          ),
        )
        // 15.sBH,
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 20.w),
        //   child: CustomButton(
        //     isDisabled: false,
        //     width: 500.w,
        //     height: 45.h,
        //     buttonText: 'Skip',
        //     onPressed: (startLoading, stopLoading, btnState) async {
        //       context
        //           .read<UserBasicDetailViewModel>()
        //           .validateDetailsAndAddData(
        //               startLoading: startLoading,
        //               stopLoading: stopLoading,
        //               context: context);
        //     },
        //     buttonTextStyle: AppTextStyle.setBarlowStyle(
        //       withTextStyle: TextStyle(
        //           color:
        //               ThemeManagerPlus.of<AppTheme>(context).currentTheme.white,
        //           fontSize: 18.sp),
        //       forBarlowFont: BarlowFontStyle.semibold,
        //     ),
        //   ),
        // )
      ],
    );
  }
}
// Container(
//   height: 75.h,
//   width: 75.h,
//   decoration: BoxDecoration(
//       shape: BoxShape.circle, color: Color(0xFF943F7F)),
//   child: Icon(
//     CupertinoIcons.camera,
//     color: Colors.white,
//   ),
// ),
// Container(
//     height: 75.h,
//     width: 75.h,
//     decoration: BoxDecoration(
//         shape: BoxShape.circle, color: Color(0xFF943F7F)),
//     child: Icon(
//       CupertinoIcons.photo_fill_on_rectangle_fill,
//       color: Colors.white,
//     )),



Future<void> checkAndRequestPermission(value) async {
  if (Platform.isAndroid) {
    PermissionStatus status = await Permission.photos.status;
    if (status.isDenied || status.isRestricted) {
      PermissionStatus requestStatus = await Permission.photos.request();
      if (requestStatus.isGranted) {
        print("Storage permission granted");
        value.openGallery();
      } else {
        print("Storage permission denied");
      }
    } else if (status.isGranted) {
      value.openGallery();
    }
  } else if (Platform.isIOS) {
    PermissionStatus status = await Permission.photos.status;
    if (status.isDenied) {
      PermissionStatus requestStatus = await Permission.photos.request();
      if (requestStatus.isGranted) {
        print("Photos permission granted");
        value.openGallery();
      } else {
        print("Photos permission denied");
      }
    } else if (status.isGranted) {
      value.openGallery();
    }
  }
}
