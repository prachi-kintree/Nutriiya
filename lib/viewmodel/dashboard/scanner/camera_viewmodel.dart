import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';

class CameraViewModel with ChangeNotifier {
  late final AnimationController flashModeControlRowAnimationController;
  late final CurvedAnimation flashModeControlRowAnimation;
  late List<CameraDescription> cameras;
  bool isDetecting = false;
  bool foodDetected = false;
  XFile? imageFile;

  void onFlashModeButtonPressed() {
    if (flashModeControlRowAnimationController.value == 1) {
      flashModeControlRowAnimationController.reverse();
    } else {
      flashModeControlRowAnimationController.forward();
      // _exposureModeControlRowAnimationController.reverse();
      // _focusModeControlRowAnimationController.reverse();
    }
  }

  Future<XFile?> takePicture(CameraController cameraController) async {
    // final CameraController? cameraController = _cameraController;
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
      final XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
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

  Future<void> setFlashMode(FlashMode mode, CameraController controller) async {
    if (controller == null) {
      return;
    }

    try {
      await controller!.setFlashMode(mode);
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  void onSetFlashModeButtonPressed(
      FlashMode mode, CameraController controller) {
    setFlashMode(mode, controller).then((_) {
      // if (mounted) {
      //   setState(() {});
      // }
      notifyListeners();
    });
  }

  void onTakePictureButtonPressed(CameraController controller) {
    takePicture(controller).then((XFile? file) {
      imageFile = file;
      if (file != null) {
        AppDecoration.showToast(message: 'Picture saved to ${file.path}');
      }
      notifyListeners();
      // if (mounted) {
      //   setState(() {
      //     imageFile = file;
      //   });
      //   if (file != null) {
      //     AppDecoration.showToast(message: 'Picture saved to ${file.path}');
      //   }
      // }
    });
  }

  Future<void> initCamera(
      Timer detectionTimer, CameraController cameraController) async {
    cameras = await availableCameras();
    final backCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);
    cameraController = CameraController(
      backCamera,
      ResolutionPreset.medium,
    );
    await cameraController.initialize();
    // if (mounted) setState(() {});
    _startFoodDetection(detectionTimer, cameraController);
    notifyListeners();
  }

  void _startFoodDetection(
      Timer detectionTimer, CameraController cameraController) {
    detectionTimer = Timer.periodic(Duration(seconds: 2), (_) async {
      if (isDetecting || !cameraController!.value.isInitialized) return;

      isDetecting = true;
      try {
        final image = await cameraController.takePicture();
        final labeler = ImageLabeler(options: ImageLabelerOptions());

        final inputImage = InputImage.fromFilePath(image.path);
        final labels = await labeler.processImage(inputImage);

        bool hasFood = labels.any((label) =>
            label.label.toLowerCase().contains("food") ||
            ["pizza", "burger", "fruit", "vegetable", "salad"]
                .contains(label.label.toLowerCase()));

        foodDetected = hasFood;

        // setState(() {
        //   _foodDetected = hasFood;
        // });

        await labeler.close();
        File(image.path).delete();
      } catch (e) {
        print("Detection error: $e");
      } finally {
        isDetecting = false;
      }
    });
  }
}
