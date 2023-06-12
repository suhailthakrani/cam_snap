import 'package:camera/camera.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  List<CameraDescription> cameras = [];
  CameraController? cameraController;
  int selectedCamera = 0;

  @override
  void onReady() {
    initializeCamera();
    super.onReady();
  }

  void initializeCamera() {
    cameraController = CameraController(cameras[selectedCamera], ResolutionPreset.high);
    cameraController!.initialize();
  }

  void switchCamer(int cameraIndex) {
    selectedCamera = cameraIndex;
    notifyChildrens();
  }

  @override
  void dispose() {
    cameraController!.dispose();
    super.dispose();
  }


}