import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/viewmodel/dashboard/scanner/meal_search_screen_viewmodel.dart';
import 'package:provider/provider.dart';

class CameraScannerScreen extends StatefulWidget {
  const CameraScannerScreen({super.key});

  @override
  State<CameraScannerScreen> createState() => _CameraScannerScreenState();
}

class _CameraScannerScreenState extends State<CameraScannerScreen> {
  CameraController? _cameraController;
  late List<CameraDescription> _cameras;
  bool _isDetecting = false;
  bool _foodDetected = false;
  Timer? _detectionTimer;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    final backCamera = _cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);
    _cameraController = CameraController(backCamera, ResolutionPreset.medium);
    await _cameraController!.initialize();
    if (mounted) setState(() {});
    _startFoodDetection();
  }

  void _startFoodDetection() {
    _detectionTimer = Timer.periodic(Duration(seconds: 2), (_) async {
      if (_isDetecting || !_cameraController!.value.isInitialized) return;

      _isDetecting = true;
      try {
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

  Widget _buildScannerCorners(context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.25,
      left: 40,
      right: 40,
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            // Top Left
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _foodDetected ? Colors.green : Colors.white,
                        width: 4),
                    left: BorderSide(
                        color: _foodDetected ? Colors.green : Colors.white,
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
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _foodDetected ? Colors.green : Colors.white,
                        width: 4),
                    right: BorderSide(
                        color: _foodDetected ? Colors.green : Colors.white,
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
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: _foodDetected ? Colors.green : Colors.white,
                        width: 4),
                    left: BorderSide(
                        color: _foodDetected ? Colors.green : Colors.white,
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
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: _foodDetected ? Colors.green : Colors.white,
                        width: 4),
                    right: BorderSide(
                        color: _foodDetected ? Colors.green : Colors.white,
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
    _cameraController?.dispose();
    _detectionTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (_foodDetected) {
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
      appNavigator.pushNamed(routeFoodCart);
    }
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Stack(
        children: [
          CameraPreview(_cameraController!),

          // Scanner Corners UI
          _buildScannerCorners(context),

          // Detection Status
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                _foodDetected ? "✅ Food Detected!" : "🔍 Scanning for food...",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: _foodDetected ? Colors.green : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
