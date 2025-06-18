import 'dart:developer';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gallery_picker/gallery_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:provider/provider.dart';
import 'package:video_compress/video_compress.dart';

import '../../RouteManager/navigator_service.dart';
import '../CustomWidgets/MediaWidgets/video_thumbnail_widget.dart';
import '../styles/app_decoration.dart';
import 'media_model.dart';

class ImagePickerManager {
  // List<BottomSheetTileModel> options = [];
  bool isForCoverImage = false;
  String _userimagePath = ' ';

  String get userimagePath => _userimagePath;

  set userimagePath(String value) {
    _userimagePath = value;
  }

  setUpOptions() {
    //   options = [
    //     BottomSheetTileModel(
    //         title: LocaleKeys.select_media_camera.tr(),
    //         leadingIconPath: svgCameraOutlined,
    //         onPressed: () {}),
    //     BottomSheetTileModel(
    //         title: LocaleKeys.select_media_gallery.tr(),
    //         leadingIconPath: svgPhotoIcon,
    //         onPressed: () {}),
    //   ];
    //
    //   options[0].onPressed = () {
    //     openCamera();
    //   };
    //
    //   options[1].onPressed = () {
    //     openGallery();
    //   };
  }

  openCamera() async {
    final ImagePicker picker = ImagePicker();

    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      showImageCropper(imagePath: photo.path);
    }
  }

  bool isVideoFile(String filePath) {
    final file = File(filePath);
    final fileExtension = file.path.split('.').last.toLowerCase();

    return (fileExtension == 'mp4' ||
        fileExtension == 'mov' ||
        fileExtension == 'avi');
  }

  openGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);

    if (photo != null) {
      showImageCropper(imagePath: photo.path);
    }
  }

  bool isVideoOrImage(String filePath) {
    final videoExtensions = ['.mp4', '.avi', '.mov', '.mkv', '.wmv'];
    final imageExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.bmp'];

    final fileExtension = "." + filePath.split('.').last.toLowerCase();

    if (videoExtensions.contains(fileExtension)) {
      return true;
    } else if (imageExtensions.contains(fileExtension)) {
      return true;
    } else {
      return false;
    }
  }

  // Future<List<CustomMediaModel>> selectMultMedia() async {
  //   final ImagePicker picker = ImagePicker();
  //   List<XFile> pickedMedia = await picker.pickMultipleMedia();
  //   List<XFile> selectedMedia = [];
  //   bool hasSelectedDifferentFile = false;
  //   for (XFile file in pickedMedia) {
  //     if (isVideoOrImage(file.path)) {
  //       hasSelectedDifferentFile = true;
  //       selectedMedia.add(file);
  //     }
  //   }
  //   if (hasSelectedDifferentFile && selectedMedia.isNotEmpty) {
  //     // AppDecoration.showToast(
  //     //     message: "Only images and video files are supported");
  //   }
  //   if (selectedMedia.isEmpty) {
  //     return [];
  //   } else {
  //     List<CustomMediaModel> userMedia = selectedMedia
  //         .map((e) => CustomMediaModel(
  //             isSelected: true,
  //             displayWidget: Container(
  //               child: isVideoFile(e.path)
  //                   ? VideoThumbnailWidget(videoUrl: e.path)
  //                   : Image.file(
  //                       File(e.path),
  //                       width: 200,
  //                       height: 200,
  //                       fit: BoxFit.cover,
  //                     ),
  //             ),
  //             filePath: e.path))
  //         .toList();
  //
  //     return userMedia;
  //   }
  // }

  // Future<List<CustomMediaModel>> selectMultMedia() async {
  //   final List<CustomMediaModel> userMedia = [];
  //   // Request permission to access photos and videos
  //   final PermissionState permission = await PhotoManager.requestPermissionExtend();
  //   if (permission.isAuth) {
  //     // Fetch media from the gallery
  //     List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
  //       type: RequestType.common, // Request both images and videos
  //       onlyAll: true,
  //     );
  //     // Get the first album (usually "Recent" or "All")
  //     AssetPathEntity path = paths.first;
  //     List<AssetEntity> assets = await path.getAssetListPaged(page: 0, size: 100); // Fetch up to 100 assets
  //     for (AssetEntity asset in assets) {
  //       File? file = await asset.file;
  //       if (file != null) {
  //         Widget displayWidget;
  //         if (asset.type == AssetType.video) {
  //           // Generate a thumbnail for video files
  //           final uint8list = await VideoThumbnail.thumbnailData(
  //             video: file.path,
  //             imageFormat: ImageFormat.JPEG,
  //             maxWidth: 200,
  //             quality: 25,
  //           );
  //           displayWidget = Image.memory(
  //             uint8list!,
  //             width: 200,
  //             height: 200,
  //             fit: BoxFit.cover,
  //           );
  //         } else {
  //           // Display image files
  //           displayWidget = Image.file(
  //             file,
  //             width: 200,
  //             height: 200,
  //             fit: BoxFit.cover,
  //           );
  //         }
  //         userMedia.add(CustomMediaModel(
  //           isSelected: true,
  //           displayWidget: displayWidget,
  //           filePath: file.path,
  //         ));
  //       }
  //     }
  //   } else {
  //     // Handle permission denied
  //     print('Permission denied');
  //     return [];
  //   }
  //   return userMedia;
  // }// Helper method to determine if the file is a video

  // Future<List<CustomMediaModel>> selectMultMedia(BuildContext context) async {
  //   List<MediaFile>? result = await GalleryPicker.pickMedia(context: context,singleMedia: false);
  //   print("989898 -- ${result?.first.file?.path} ${result?.length} -- ${result?.first.file?.uri} -- ${result?.first.file?.absolute} -- ${result?.first.file?.isAbsolute}");
  //   print("989898 -- ${result?.first.file?.path} ${result?.first.file?.parent} -- ${result?.first.file?.uri} -- ${result?.first.file?.absolute} -- ${result?.first.file?.isAbsolute}");
  //
  //   if (result == null) {
  //     return [];
  //   }
  //   List<MediaFile> pickedFiles = result;
  //   print("989898 -- ${pickedFiles.first.isImage}");
  //
  //   List<CustomMediaModel> userMedia = pickedFiles
  //       .map((file) => CustomMediaModel(
  //     isSelected: true,
  //     displayWidget: Container(
  //       child: ThumbnailMedia(media: file)
  //     ),
  //     filePath: file.file?.path,
  //   ))
  //       .toList();
  //   print("989898 ${userMedia.first.displayWidget} ${userMedia.length}");
  //   return userMedia;
  // }

  Future<List<CustomMediaModel>> selectMultMedia({context}) async {
    FilePickerResult? result;
    // final status = Platform.isIOS
    //     ? await Permission.photos.request()
    //     : await Permission.photos.request();

    final status = await requestAppropriatePermission();
    print("Permission -- $status");

    if (status.isGranted) {
      result = await FilePicker.platform.pickFiles(
        initialDirectory: Platform.isIOS ? null : "Recent",
        withData: true,
        allowMultiple: true,
        type: FileType.media,
      );
    }

    if (result == null) {
      return [];
    }
    List<PlatformFile> pickedFiles = result.files;
    List<CustomMediaModel> userMedia = pickedFiles
        .map((file) => CustomMediaModel(
              isSelected: true,
              isVideo: isVideoFile1(file.path!),
              displayWidget: Container(
                child: isVideoFile1(file.path!)
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0.r),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        child: VideoThumbnailWidget(
                          videoUrl: file.path!,
                          // imageSize: 30.h,
                          isExpanded: true,
                        ))
                    // changes done in below container for new create post image design
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0.r),
                          child: Image.file(
                            File(file.path!),
                            width: 300.h,
                            height: 300.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
              filePath: file.path!,
            ))
        .toList();
    return userMedia;
  }

  Future<PermissionStatus> requestAppropriatePermission() async {
    if (Platform.isIOS) {
      return await Permission.photos.request();
    }

    final sdkInt = (await DeviceInfoPlugin().androidInfo).version.sdkInt;
    return sdkInt <= 32
        ? await Permission.storage.request()
        : await Permission.photos.request();
  }

  Future<List<CustomMediaModel>> selectMultImages({context}) async {
    FilePickerResult? result;
    // final androidInfo = await DeviceInfoPlugin().androidInfo;

    // final status = Platform.isIOS
    //     ? await Permission.photos.request()
    //     :
    //     //  androidInfo.version.sdkInt <= 32
    //     //     ? await Permission.storage.request()
    //     //     :
    //     await Permission.photos.request();

    final status = await requestAppropriatePermission();

    print("Permission -- $status");

    if (status.isGranted) {
      result = await FilePicker.platform.pickFiles(
        initialDirectory: Platform.isIOS ? null : "Recent",

        withData: true,
        allowMultiple: false,
        type: FileType.image, // Only allow image selection
      );
    }

    if (result == null) {
      return [];
    }

    List<PlatformFile> pickedFiles = result.files;
    List<CustomMediaModel> userMedia = pickedFiles
        .map((file) => CustomMediaModel(
              isSelected: true,
              isVideo: false, // Only images, so set to false
              displayWidget: Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0.r),
                  child: Image.file(
                    File(file.path!),
                    width: 300.h,
                    height: 300.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              filePath: file.path!,
            ))
        .toList();

    return userMedia;
  }

  Future<List<CustomMediaModel>> selectVideoImagesForChat({context}) async {
    FilePickerResult? result;

    final status = await requestAppropriatePermission();

    print("Permission -- $status");

    if (status.isGranted) {
      result = await FilePicker.platform.pickFiles(
          initialDirectory: Platform.isIOS ? null : "Recent",
          withData: true,
          allowMultiple: false,
          type: FileType.media
          // type: FileType.custom,
          // allowedExtensions: ['jpg', 'jpeg', 'png', 'gif', 'mp4', 'mov', 'avi'],
          );
    }

    if (result == null) return [];

    List<PlatformFile> pickedFiles = result.files;

    List<CustomMediaModel> userMedia = pickedFiles.map((file) {
      final path = file.path!;
      final isVideo = path.toLowerCase().endsWith('.mp4') ||
          path.toLowerCase().endsWith('.mov') ||
          path.toLowerCase().endsWith('.avi');

      return CustomMediaModel(
        isSelected: true,
        isVideo: isVideo,
        filePath: path,
        displayWidget: Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0.r),
            child: isVideo
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 300.h,
                        height: 300.h,
                        color: Colors.black12,
                        child: Icon(Icons.videocam, size: 40.sp),
                      ),
                      Positioned(
                        bottom: 10,
                        child: Text(
                          "Video",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  )
                : Image.file(
                    File(path),
                    width: 300.h,
                    height: 300.h,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      );
    }).toList();

    return userMedia;
  }

  void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Permission Required'),
        content: Text('Please grant access to the photo library in settings.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings(); // Open app settings
            },
            child: Text('Open Settings'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  // Future<List<CustomMediaModel>> selectMultMedia() async {
  //   final ImagePicker picker = ImagePicker();
  //   List<XFile> pickedMedia = await picker.pickMultipleMedia();
  //   List<XFile> selectedMedia = [];
  //   bool hasSelectedDifferentFile = false;
  //   for (XFile file in pickedMedia) {
  //     if (isVideoOrImage(file.path)) {
  //       hasSelectedDifferentFile = true;
  //       selectedMedia.add(file);
  //     }
  //   }
  //   if (hasSelectedDifferentFile && selectedMedia.isNotEmpty) {
  //     // AppDecoration.showToast(
  //     //     message: "Only images and video files are supported");
  //   }
  //   if (selectedMedia.isEmpty) {
  //     return [];
  //   } else {
  //     List<CustomMediaModel> userMedia = selectedMedia
  //         .map((e) => CustomMediaModel(
  //         isSelected: true,
  //         displayWidget: Container(
  //           child: isVideoFile(e.path)
  //               ? VideoThumbnailWidget(videoUrl: e.path)
  //               : Image.file(
  //             File(e.path),
  //             width: 200,
  //             height: 200,
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //         filePath: e.path))
  //         .toList();
  //
  //     return userMedia;
  //   }
  // }
  bool isVideoFile1(String path) {
    final videoExtensions = ['mp4', 'mov', 'avi'];
    return videoExtensions.contains(path.split('.').last.toLowerCase());
  }

// Helper method to determine if the file is an image or video
  bool isVideoOrImage2(String path) {
    final supportedExtensions = [
      'jpg',
      'jpeg',
      'png',
      'gif',
      'mp4',
      'mov',
      'avi'
    ];
    return supportedExtensions.contains(path.split('.').last.toLowerCase());
  }

  showImageCropper({required String imagePath}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath,
      // cropStyle: isForCoverImage ? CropStyle.rectangle : CropStyle.circle,
      aspectRatio: const CropAspectRatio(ratioX: 100, ratioY: 100),
      // aspectRatioPresets: [
      //   CropAspectRatioPreset.square,
      //   CropAspectRatioPreset.ratio3x2,
      //   CropAspectRatioPreset.original,
      //   CropAspectRatioPreset.ratio4x3,
      //   CropAspectRatioPreset.ratio16x9
      // ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Kintree',
            toolbarColor: Color(0xFFFF6200EE),
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    if (croppedFile != null) {
      XFile? compressedImage = await compressAndGetFile(croppedFile);
      if (compressedImage != null) {
        userimagePath = compressedImage.path;
        log("current image : ${userimagePath}");
        uploadImage(imagePath: compressedImage.path);
      }
    }
  }

  Future<XFile?> compressAndGetFile(
    CroppedFile file,
  ) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var result = await FlutterImageCompress.compressAndGetFile(
      file.path,
      tempPath + "compress.jpg",
      quality: 88,
    );

    return result;
  }

  Future<XFile?> compressAndGetImageFile(
    File? file,
  ) async {
    if (file != null) {
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      var result = await FlutterImageCompress.compressAndGetFile(
        file.path,
        // tempPath + ".jpg",
        // // tempPath + "compress.jpg",
        tempPath + "${DateTime.now().toIso8601String()}.jpg",
        quality: 88,
      );

      log("image compressed here $result");

      return result;
    } else {
      return null;
    }
  }

  // Future<File?> compresAndGetVideoFile({required String sourcePath}) async {
  //   MediaInfo? mediaInfo = await VideoCompress.compressVideo(
  //     sourcePath,
  //     quality: VideoQuality.DefaultQuality,
  //     deleteOrigin: false, // It's false by default
  //   );

  //   return mediaInfo?.file;
  // }

  Future<File?> compressAndGetVideoFile(File videoFile) async {
    // Wait for any ongoing compression to finish
    await VideoCompress.cancelCompression(); // Cancel any previous compression

    final MediaInfo? info = await VideoCompress.compressVideo(
      videoFile.path,
      quality: VideoQuality.MediumQuality,
      deleteOrigin: false, // Keep original file after compression
    );

    if (info != null && info.file != null) {
      return File(info.file!.path); // Return the compressed file
    } else {
      throw Exception('Video compression failed');
    }
  }

  uploadImage({required String imagePath}) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      // 'Auth-key': 'familyrestapi',
      'x-api-key': 'kintreerestapi'
    };
    // if (getIt<LocalDataManager>().userToken.isNotEmpty) {
    //   // header["Auth-Token"] = getIt<LocalDataManager>().userToken;
    //   header["Authorization"] = "Bearer ${getIt<LocalDataManager>().userToken}";
    // }
    String url = "";

    if (isForCoverImage) {
      // url = AppEnvironment.baseUrl + apiUpdateCoverImage;
    } else {
      // url = AppEnvironment.baseUrl + apiUpdateProfileImage;
    }

    var formData = FormData.fromMap({
      // 'userId': getIt<LocalDataManager>().userId,
      (isForCoverImage ? 'cover_image' : 'profile_image'):
          await MultipartFile.fromFile(imagePath, filename: "compress.jpg"),
    });
    Options options = Options(headers: header);
    await Dio().post(url, data: formData, options: options);

    AppDecoration.showToast(message: "Uploaded");
    // appNavigator.navigationContext
    //     ?.read<AddTreeMemberViewModel>()
    //     .reloadFamilyTree(shouldAddMember: false);
    // appNavigator.navigationContext
    //     ?.read<ProfileViewModel>()
    //     .populateRespectiveFields(
    //         context: appNavigator.navigationContext!,
    //         callback: () {
    //           appNavigator.maybePop();
    //         });
  }
}
