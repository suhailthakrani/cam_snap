import 'dart:io';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;
  RxBool isCameraLoaded = false.obs;

  // Temporarily

  int selectedCamera = 0;

  @override
  Future<void> onInit() async {
    await initializeCamera();
    super.onInit();
  }

  Future<void> initializeCamera() async {
    try {
      cameras = await availableCameras();

      if (cameras.isEmpty) {
        print("[NO CAMERA IS AVAILABLE]");
      } else {
        cameraController =
            CameraController(cameras[selectedCamera], ResolutionPreset.medium);
        await cameraController!.initialize();
        isCameraLoaded.value = true;
      }
    } on Exception catch (e) {
      print("[ERROR IN CAMERA PERMISSION]: $e");
    }
    // notifyChildrens();
  }

  void switchCamera(int cameraIndex) {
    selectedCamera = cameraIndex;
  }


  Future<File?> captureImage() async {
  try {
    ImagePicker imagePicker = ImagePicker();
    final XFile? imageFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      File capturedImageFile = File(imageFile.path);
      return capturedImageFile;
    }
  } catch (e) {
    print('Error capturing image: $e');
  }
  return null;
}

  @override
  void dispose() {
    cameraController!.dispose();
    super.dispose();
  }
}
