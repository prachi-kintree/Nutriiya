import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';

class CameraViewModel with ChangeNotifier {
  bool isDetecting = false;
  bool foodDetected = false;
  XFile? imageFile;
  CameraController? cameraController;

  updateListner() {
    notifyListeners();
  }

  // void onSetFlashModeButtonPressed(FlashMode mode) {
  //   setFlashMode(mode).then((_) {
  //     if (mounted) {
  //       setState(() {});
  //     }
  //   });
  // }

  Future<void> setFlashMode(FlashMode mode) async {
    if (cameraController == null) {
      return;
    }

    try {
      await cameraController?.setFlashMode(mode);
    } on CameraException catch (e) {
      showCameraException(e);
      rethrow;
    }
    notifyListeners();
  }

  void showCameraException(CameraException e) {
    _logError(e.code, e.description);
    AppDecoration.showToast(message: 'Error: ${e.code}\n${e.description}');
  }

  void _logError(String code, String? message) {
    // ignore: avoid_print
    print('Error: $code${message == null ? '' : '\nError Message: $message'}');
  }

  Future<void> initCamera(Timer? detectionTimer) async {
    final cameras = await availableCameras();

    // Get all back-facing cameras
    final backCameras = cameras
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

    cameraController = CameraController(
      mainBackCamera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    await cameraController?.initialize();
    notifyListeners();
    _startFoodDetection(detectionTimer);
    notifyListeners();
    // your detection logic
  }

  void _startFoodDetection(
    Timer? detectionTimer,
  ) {
    detectionTimer = Timer.periodic(Duration(seconds: 2), (_) async {
      if (isDetecting || !cameraController!.value.isInitialized) return;

      isDetecting = true;
      // this start capturing on init
      try {
        // await cameraController!.setFlashMode(FlashMode.off);
        final image = await cameraController!.takePicture();
        final labeler = ImageLabeler(options: ImageLabelerOptions());

        final inputImage = InputImage.fromFilePath(image.path);
        final labels = await labeler.processImage(inputImage);

        bool hasFood = labels.any((label) =>
            label.label.toLowerCase().contains("food") ||
            ["pizza", "burger", "fruit", "vegetable", "salad"]
                .contains(label.label.toLowerCase()));

        // setState(() {
        //   _foodDetected = hasFood;
        // });
        foodDetected = hasFood;
        notifyListeners();
        await labeler.close();
        File(image.path).delete();
        notifyListeners();
      } catch (e) {
        print("Detection error: $e");
      } finally {
        isDetecting = false;
        notifyListeners();
      }
    });
  }
}
