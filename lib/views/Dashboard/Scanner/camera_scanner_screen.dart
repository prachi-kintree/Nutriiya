import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/CustomWidgets/Login/profile_image_selection_widget.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:nutriya/utils/utils.dart';
import 'package:nutriya/viewmodel/dashboard/scanner/camera_viewmodel.dart';
import 'package:nutriya/viewmodel/dashboard/scanner/food_logger_viewmodel.dart';
import 'package:nutriya/viewmodel/dashboard/scanner/meal_search_screen_viewmodel.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';
import 'package:provider/provider.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

class CameraScannerScreen extends StatefulWidget {
  const CameraScannerScreen({super.key});

  @override
  State<CameraScannerScreen> createState() => _CameraScannerScreenState();
}

class _CameraScannerScreenState extends State<CameraScannerScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController? _cameraController;
  late final AnimationController _flashModeControlRowAnimationController;
  late final CurvedAnimation _flashModeControlRowAnimation;
  late List<CameraDescription> _cameras;
  bool _isDetecting = false;
  bool _foodDetected = false;
  Timer? _detectionTimer;
  XFile? imageFile;

  @override
  void initState() {
    super.initState();
    // final controller = context.read<CameraViewModel>();
    WidgetsBinding.instance.addObserver(this);
    // controller.initCamera(_detectionTimer!, _cameraController!);
    _initCamera();
    _flashModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _flashModeControlRowAnimation = CurvedAnimation(
      parent: _flashModeControlRowAnimationController,
      curve: Curves.easeInCubic,
    );
    // controller.flashModeControlRowAnimationController = AnimationController(
    //   duration: const Duration(milliseconds: 300),
    //   vsync: this,
    // );
    // controller.flashModeControlRowAnimation = CurvedAnimation(
    //   parent: controller.flashModeControlRowAnimationController,
    //   curve: Curves.easeInCubic,
    // );
  }

  void onSetFlashModeButtonPressed(FlashMode mode) {
    setFlashMode(mode).then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  Future<void> setFlashMode(FlashMode mode) async {
    if (_cameraController == null) {
      return;
    }

    try {
      await _cameraController!.setFlashMode(mode);
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  void _showCameraException(CameraException e) {
    _logError(e.code, e.description);
    AppDecoration.showToast(message: 'Error: ${e.code}\n${e.description}');
  }

  void _logError(String code, String? message) {
    // ignore: avoid_print
    print('Error: $code${message == null ? '' : '\nError Message: $message'}');
  }

  void onFlashModeButtonPressed() {
    if (_flashModeControlRowAnimationController.value == 1) {
      _flashModeControlRowAnimationController.reverse();
    } else {
      _flashModeControlRowAnimationController.forward();
      // _exposureModeControlRowAnimationController.reverse();
      // _focusModeControlRowAnimationController.reverse();
    }
  }

  Future<XFile?> capturePicture() async {
    final CameraController? cameraController = _cameraController;
    if (cameraController == null || !cameraController.value.isInitialized) {
      // showInSnackBar('Error: select a camera first.');
      AppDecoration.showToast(message: "Error: select a camera first.");
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      // _startFoodDetection();
      if (_foodDetected) {
        final XFile file = await cameraController.takePicture();
        return file;
      } else {
        AppDecoration.showToast(message: "No food detected.");
      }
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  // Future<XFile?> capturePicture() async {
  //   final CameraController? cameraController = _cameraController;

  //   if (cameraController == null || !cameraController.value.isInitialized) {
  //     AppDecoration.showToast(message: "Camera not ready.");
  //     return null;
  //   }

  //   if (_isDetecting || cameraController.value.isTakingPicture) return null;

  //   setState(() => _isDetecting = true);

  //   XFile? image;

  //   try {
  //     image = await cameraController.takePicture();

  //     final inputImage = InputImage.fromFilePath(image.path);
  //     final labeler = ImageLabeler(options: ImageLabelerOptions());
  //     final labels = await labeler.processImage(inputImage);
  //     await labeler.close();

  //     final hasFood = labels.any((label) =>
  //         label.label.toLowerCase().contains("food") ||
  //         ["pizza", "burger", "fruit", "vegetable", "salad"]
  //             .contains(label.label.toLowerCase()));

  //     if (hasFood) {
  //       // context.read<FoodLoggerViewmodel>().currentMeal = 'Breakfast';
  //       // context.read<MealSearchScreenViewmodel>().selectFood(
  //       //       SuggestedFood(
  //       //         foodname: "Egg",
  //       //         calories: 72,
  //       //         serving: 1,
  //       //         protein: 12,
  //       //         carbs: 30,
  //       //         fat: 20,
  //       //         quantity: 60,
  //       //         fibre: 15,
  //       //       ),
  //       //     );

  //       // await appNavigator.pushNamed(routeFoodCart);
  //       setState(() {
  //         _foodDetected = true;
  //       });
  //     } else {
  //       AppDecoration.showToast(message: "No food detected.");
  //     }

  //     return image; // ✅ return image whether food found or not
  //   } catch (e) {
  //     print("Capture or detection error: $e");
  //     AppDecoration.showToast(message: "Something went wrong.");
  //     return null;
  //   } finally {
  //     if (mounted) setState(() => _isDetecting = false);
  //   }
  // }

  void onTakePictureButtonPressed() {
    capturePicture().then((XFile? file) {
      if (mounted) {
        setState(() {
          imageFile = file;
        });
        if (file != null) {
          if (_foodDetected) {
            // if (context.read<CameraViewModel>().foodDetected) {

            // _detectionTimer?.cancel();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<FoodLoggerViewmodel>().currentMeal = 'Breakfast';
              context.read<MealSearchScreenViewmodel>().selectFood(
                    SuggestedFood(
                        foodname: "Egg",
                        calories: 72,
                        serving: 1,
                        protein: 12,
                        carbs: 30,
                        fat: 20,
                        quantity: 60,
                        fibre: 15),
                  );
              // _foodDetected = false;
              // stopFoodDetection();
              appNavigator.pushNamed(routeFoodCart);
            });
          }
          // AppDecoration.showToast(message: 'Picture saved to ${file.path}');
        }
      }
    });
  }

  Widget _captureControlRowWidget() {
    // Widget _captureControlRowWidget(CameraController? cameraController) {
    final CameraController? cameraController = _cameraController;

    return Container(
      color: Colors.black87,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // IconButton(
          //   icon: const Icon(Icons.photos),
          //   color: Colors.white,
          //   onPressed: () {},
          //   // onPressed: cameraController != null &&
          //   //         cameraController.value.isInitialized &&
          //   //         !cameraController.value.isRecordingVideo
          //   //     ? onTakePictureButtonPressed
          //   //     : null,
          // ),
          InkWell(
              onTap: () {
                ImagePickerManager().openGallery();
              },
              child: SvgPicture.asset(svgGallary)),
          InkWell(
            onTap: () {
              cameraController != null &&
                      cameraController.value.isInitialized &&
                      !cameraController.value.isRecordingVideo
                  ? onTakePictureButtonPressed()
                  : null;
            },
            child: Container(
              height: 50.h,
              width: 50.h,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  color: Color(0xffD9D9D9),
                  shape: BoxShape.circle),
              // child:
              //  IconButton(
              //   icon: const Icon(Icons.camera_alt),
              //   color: Colors.black,
              //   onPressed: cameraController != null &&
              //           cameraController.value.isInitialized &&
              //           !cameraController.value.isRecordingVideo
              //       ? onTakePictureButtonPressed
              //       : null,
              // ),
            ),
          ),
          SizedBox(
            height: 20.w,
            width: 20.w,
          )
        ],
      ),
    );
  }

  // Future<void> _initCamera() async {
  //   _cameras = await availableCameras();
  //   final backCamera = _cameras.firstWhere(
  //       (camera) => camera.lensDirection == CameraLensDirection.back);
  //   _cameraController = CameraController(
  //     backCamera,
  //     ResolutionPreset.max,
  //   );
  //   await _cameraController!.initialize();
  //   if (mounted) setState(() {});
  //   _startFoodDetection();
  // }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();

    // Get all back-facing cameras
    final backCameras = _cameras
        .where(
          (camera) => camera.lensDirection == CameraLensDirection.back,
        )
        .toList();

    // Print camera info for debugging
    for (var cam in backCameras) {
      print(
          'Camera: ${cam.name}, lensDirection: ${cam.lensDirection}, orientation: ${cam.sensorOrientation}');
    }

    // Pick the first one with highest resolution or default to first
    // Assuming the main camera is the first back-facing one
    final CameraDescription mainBackCamera = backCameras[0];

    _cameraController = CameraController(
      mainBackCamera,
      ResolutionPreset.max,
      enableAudio: false,
    );

    await _cameraController!.initialize();

    if (mounted) setState(() {});
    _startFoodDetection(); // your detection logic
  }

  void _startFoodDetection() {
    _detectionTimer = Timer.periodic(Duration(seconds: 2), (_) async {
      if (_isDetecting || !_cameraController!.value.isInitialized) return;

      _isDetecting = true;
      // this start capturing on init
      try {
        await _cameraController!.setFlashMode(FlashMode.off);
        final image = await _cameraController!.takePicture();
        final labeler = ImageLabeler(options: ImageLabelerOptions());

        final inputImage = InputImage.fromFilePath(image.path);
        final labels = await labeler.processImage(inputImage);

        bool hasFood = labels.any((label) =>
            label.label.toLowerCase().contains("food") ||
            ["pizza", "burger", "fruit", "vegetable", "salad"]
                .contains(label.label.toLowerCase()));

        setState(() {
          _foodDetected = hasFood;
        });

        await labeler.close();
        File(image.path).delete();
      } catch (e) {
        print("Detection error: $e");
      } finally {
        _isDetecting = false;
      }
    });
  }

  void stopFoodDetection() {
    _detectionTimer?.cancel();
    _detectionTimer = null;
    _isDetecting = false;
  }

  Widget _buildScannerCorners(context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.25,
      left: 40,
      right: 40,
      child: SizedBox(
        height: 400,
        child: Stack(
          children: [
            // Top Left
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 50,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(43.0.r),
                      bottomRight: Radius.circular(10.0.r)),
                  border: Border(
                    top: BorderSide(
                        color: _foodDetected ? Colors.green : Colors.white,
                        // color: Colors.white,
                        width: 4),
                    left: BorderSide(
                        color: _foodDetected ? Colors.green : Colors.white,
                        // color: Colors.white,
                        width: 4),
                  ),
                ),
              ),
            ),
            // Top Right
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 50,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(43.0.r),
                      bottomLeft: Radius.circular(10.0.r)),
                  border: Border(
                    top: BorderSide(
                        color: _foodDetected ? Colors.green : Colors.white,
                        // color: Colors.white,
                        width: 4),
                    right: BorderSide(
                        color: _foodDetected ? Colors.green : Colors.white,
                        // color: Colors.white,
                        width: 4),
                  ),
                ),
              ),
            ),
            // Bottom Left
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: 50,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(43.0.r),
                      topRight: Radius.circular(10.0.r)),
                  border: Border(
                    bottom: BorderSide(
                        color: _foodDetected ? Colors.green : Colors.white,
                        // color: Colors.white,
                        width: 4),
                    left: BorderSide(
                        color: _foodDetected ? Colors.green : Colors.white,
                        // color: Colors.white,
                        width: 4),
                  ),
                ),
              ),
            ),
            // Bottom Right
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 50,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(43.0.r),
                      topLeft: Radius.circular(10.0.r)),
                  border: Border(
                    bottom: BorderSide(
                        color: _foodDetected ? Colors.green : Colors.white,
                        // color: Colors.white,
                        width: 4),
                    right: BorderSide(
                        color: _foodDetected ? Colors.green : Colors.white,
                        // color: Colors.white,
                        width: 4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // _cameraController?.dispose();
    WidgetsBinding.instance.removeObserver(this);

    _flashModeControlRowAnimationController.dispose();
    _flashModeControlRowAnimation.dispose();
    // stopFoodDetection();
    // context
    //     .read<CameraViewModel>()
    //     .flashModeControlRowAnimationController
    //     .dispose();
    // context.read<CameraViewModel>().flashModeControlRowAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return Scaffold(
          body: Center(
              child: CircularProgressIndicator(
        color: ThemeManagerPlus.of<AppTheme>(context).currentTheme.primaryGreen,
      )));
    }
    // if (_foodDetected) {
    //   // if (context.read<CameraViewModel>().foodDetected) {

    //   _detectionTimer?.cancel();
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     context.read<FoodLoggerViewmodel>().currentMeal = 'Breakfast';
    //     context.read<MealSearchScreenViewmodel>().selectFood(
    //           SuggestedFood(
    //               foodname: "Egg",
    //               calories: 72,
    //               serving: 1,
    //               protein: 12,
    //               carbs: 30,
    //               fat: 20,
    //               quantity: 60,
    //               fibre: 15),
    //         );
    //     _foodDetected = false;
    //     // stopFoodDetection();
    //     appNavigator.pushNamed(routeFoodCart);
    //   });
    // }
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        bottomNavigationBar: _captureControlRowWidget(),
        body: SizedBox(
          // height: 0.8.sh,
          // width: 1.sw,
          child: Stack(
            // fit: StackFit.expand,
            children: [
              Transform.scale(
                alignment: Alignment.topCenter,
                scale: 1 /
                    (_cameraController!.value.aspectRatio *
                        MediaQuery.of(context).size.aspectRatio),
                child: CameraPreview(
                  _cameraController!,
                ),
              ),

              // Positioned.fill(
              //   child: FittedBox(
              //     fit: BoxFit.cover,
              //     child: SizedBox(
              //       width: _cameraController!.value.previewSize!.height,
              //       height: _cameraController!.value.previewSize!.width,
              //       child: CameraPreview(_cameraController!),
              //     ),
              //   ),
              // ),

              // Scanner Corners UI
              _buildScannerCorners(context),

              // Detection Status
              Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 100.h,
                    child: Row(
                      children: [
                        20.sBW,
                        GestureDetector(
                            onTap: () {
                              appNavigator.goBack();
                            },
                            child: SvgPicture.asset(
                              svgBackArrow,
                              color: Colors.white,
                            )),
                        const Spacer(),
                        Text("Food Analysis",
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 20.sp, color: Colors.white),
                                outfitFont: OutfitFontStyle.bold)),
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              appNavigator.goBack();
                            },
                            child: GestureDetector(
                                onTap: () {
                                  if (_cameraController?.value.flashMode ==
                                      FlashMode.torch) {
                                    // context
                                    //     .read<CameraViewModel>()
                                    //     .onSetFlashModeButtonPressed(
                                    //         FlashMode.off, _cameraController!);
                                    onSetFlashModeButtonPressed(FlashMode.off);
                                  } else {
                                    // context
                                    //     .read<CameraViewModel>()
                                    //     .onSetFlashModeButtonPressed(
                                    //         FlashMode.torch, _cameraController!);
                                    onSetFlashModeButtonPressed(
                                        FlashMode.torch);
                                  }
                                },
                                child: SvgPicture.asset(
                                  svgFlashIcon,
                                  color: _cameraController?.value.flashMode ==
                                          FlashMode.torch
                                      ? ThemeManagerPlus.of<AppTheme>(context)
                                          .currentTheme
                                          .primaryGreen
                                      : Colors.white,
                                ))),
                        20.sBW,
                      ],
                    ),
                  )),
              // Positioned(
              //     top: 733,
              //     // bottom: 20,
              //     left: 0,
              //     right: 0,
              //     child: _captureControlRowWidget()
              //     // child: _captureControlRowWidget(_cameraController)
              //     ),
            ],
          ),
        ),
      ),
    );
  }
}
