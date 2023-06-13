import 'dart:io';

import 'package:cam_snap/controllers/home_camera_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageView extends GetView<HomeController> {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(),
      body: Center(
        // width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.file(
                File(controller.recentCapturedImage.value, ), fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
