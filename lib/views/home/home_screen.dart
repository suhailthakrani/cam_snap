import 'package:cam_snap/controllers/home_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/camera_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final camera = controller.cameras.first;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "Cam Snap",
            style: TextStyle(
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        body: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Expanded(
                    child: CameraWidget(
                        controller: controller, height: height, width: width),
                  ),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return _loadingWidget();
            }
            return _errorWidget();
          },
        ));
  }

  Center _loadingWidget() => const Center(child: CircularProgressIndicator());

  Center _errorWidget() {
    return const Center(
      child: Text("Ups! Something went wrong."),
    );
  }
}


