import 'package:camera/camera.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;
  RxBool isCameraLoaded = false.obs;
  RxString recentCapturedImage = "".obs;

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
            CameraController(cameras[selectedCamera], ResolutionPreset.high);
        await cameraController!.initialize();
        isCameraLoaded.value = true;
      }
    } on CameraException catch (e) {
      print("[ERROR IN CAMERA PERMISSION]: ${e.description}");
    }
  }

  void switchCamera(int cameraIndex) {
    selectedCamera = cameraIndex;
    initializeCamera();
  }
  Future<void> captureImage() async {
    try {
     XFile xFile = await cameraController!.takePicture();
     if (xFile.path.isNotEmpty) {
       recentCapturedImage.value = xFile.path;
     }

    } catch (e) {
      print('[Error capturing image]: $e');
    }
  }
}
