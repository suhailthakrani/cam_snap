import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  RxBool showBottomSheet = true.obs;
  List<CameraDescription> cameras = [];
  CameraController? cameraController;
  RxBool isCameraLoaded = false.obs;
  RxString recentCapturedImage = "".obs;
  RxList<String> imagePaths = <String>[].obs;
  RxInt currentImageIndex = 0.obs;

  // For Ratio
  RxBool isRatioPressed = false.obs;
  // For Flash
  List<FlashMode> flashModes = [
    FlashMode.auto,
    FlashMode.torch,
    FlashMode.off,
    FlashMode.always
  ];
  // FLash Mode
  Rx<FlashMode> currentFlashMode = FlashMode.auto.obs;

  // Temporarily
  int selectedCamera = 0;

  @override
  Future<void> onInit() async {
    await initializeCamera();
    super.onInit();
  }
    @override
  Future<void> onClose() async {
    cameraController!.stopImageStream();
    cameraController!.dispose();
    super.onClose();
  }
  
  

  Future<void> initializeCamera() async {
    try {
      cameras = await availableCameras();

      if (cameras.isEmpty) {
        print("[NO CAMERA IS AVAILABLE]");
      } else {
        cameraController =
            CameraController(cameras[selectedCamera], ResolutionPreset.high);
        await cameraController!.initialize();
        cameraController!.startImageStream((CameraImage image) {
          // Image processing logic
        });
        isCameraLoaded.value = true;
      }
    } on CameraException catch (e) {
      print("[ERROR IN CAMERA PERMISSION]: ${e.description}");
    }
  }
  //

  // Change Flash Mode
  void changeFlashMode() {
    int index = flashModes.indexOf(currentFlashMode.value);
    index = (index + 1) % flashModes.length;
    cameraController!.setFlashMode(flashModes[index]);
    currentFlashMode.value = flashModes[index];
  }

  Future<void> switchCamera() async {
    if (cameraController != null) {
      try {
        cameras = await availableCameras();
        isCameraLoaded.value = false;
        if (cameraController!.value.isStreamingImages) {
          await cameraController!.stopImageStream();
        }
        await cameraController!.dispose();

        selectedCamera = (selectedCamera + 1) % cameras.length;

        if (cameras.isEmpty) {
          print("[NO FRONT CAMERA IS AVAILABLE]");
        } else {
          cameraController =
              CameraController(cameras[selectedCamera], ResolutionPreset.high);
          await cameraController!.initialize();
          cameraController!.startImageStream((CameraImage image) {
            // Image processing logic
          });
          isCameraLoaded.value = true;
        }
      } on CameraException catch (e) {
        print("[ERROR IN CAMERA PERMISSION]: ${e.description}");
      }
    }
  }

  Future<void> captureImage() async {
    try {
      
      if (cameraController != null && cameraController!.value.isInitialized) {
           if (cameraController!.value.isStreamingImages) {
          await cameraController!.stopImageStream();
        }
          XFile xFile = await cameraController!.takePicture();
          if (xFile.path.isNotEmpty) {
            imagePaths.add(xFile.path);
            recentCapturedImage.value = xFile.path;
          }
        
      } else {
        print("[ERROR]: Camera is not initialized------------------->");
      }
    } catch (e) {
      print('[Error capturing image]:===========> $e');
    }
  }
  // Future<void> captureImage() async {
  //   try {
  //     XFile xFile = await cameraController!.takePicture();
  //     if (xFile.path.isNotEmpty) {
  //       recentCapturedImage.value = xFile.path;
  //     }
  //   } catch (e) {
  //     print('[Error capturing image]: $e');
  //   }
  // }

  Future<List<String>> extractDateTime({required String string}) async {
    DateTime creationDateTime = await getCreationDateTime(string);
    String formattedDate = formatDate(creationDateTime);
    String formattedTime = formatTime(creationDateTime);
    return [formattedDate, formattedTime];
  }

  Future<DateTime> getCreationDateTime(String string) async {
    File file = File(string);
    FileStat fileStat = await file.stat();
    DateTime creationDateTime = fileStat.changed;
    return creationDateTime;
  }

  String formatDate(DateTime dateTime) {
    DateFormat dateFormat = DateFormat("MMM dd, yyyy");
    String formattedDate = dateFormat.format(dateTime);
    return formattedDate;
  }

  String formatTime(DateTime dateTime) {
    DateFormat timeFormat = DateFormat("HH:mm");
    String formattedTime = timeFormat.format(dateTime);
    return formattedTime;
  }
}
