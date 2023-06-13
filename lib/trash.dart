  // Future<void> checkCameraPermisions() async {
  //   PermissionStatus permissionStatus = await Permission.camera.status;
  //   PermissionStatus audio = await Permission.audio.status;
  //   if (permissionStatus.isDenied && audio.isDenied) {
  //     permissionStatus = await Permission.camera.request();
  //     audio = await Permission.audio.request();

  //   }
  //   if(permissionStatus.isGranted && audio.isGranted) {
  //     initializeCamera();
  //   } else {
  //     print("[ERROR IN CAMERA PERMISSION]: user has denied permissions");
  //   }
  // }