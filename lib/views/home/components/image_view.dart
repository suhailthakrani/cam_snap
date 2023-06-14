import 'dart:io';

import 'package:cam_snap/controllers/home_camera_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageView extends GetView<HomeController> {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> date = Get.arguments;
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.transparent,
        // extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (date['creationDateTime']) != null &&
                        (date['creationDateTime']).isNotEmpty != ""
                    ? (date['creationDateTime']).first ?? ""
                    : controller.recentCapturedImage.value
                        .split('/')
                        .last
                        .toLowerCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: (date['creationDateTime']) != null ? 18 : 14,
                ),
              ),
              Text(
                (date['creationDateTime']) != null
                    ? (date['creationDateTime']).last
                    : "",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                print("------ ${controller.imagePaths}");
              },
              icon: const Icon(
                Icons.share_outlined,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
        body: PageView.builder(
          itemCount: controller.imagePaths.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onHorizontalDragStart: (details) => controller.showBottomSheet.value = false,
              onHorizontalDragEnd: (details) => controller.showBottomSheet.value = true,
              onVerticalDragEnd: (details) => controller.showBottomSheet.value = true,
              onVerticalDragStart: (details) =>controller.showBottomSheet.value = false,

              // onHorizontalDragEnd: (details) {
              //   if (details.velocity.pixelsPerSecond.dx > 0) {
              //     // Swipe right
              //     if (index > 0) {
              //       controller.currentImageIndex.value--;
              //     }
              //   } else if (details.velocity.pixelsPerSecond.dx < 0) {
              //     // Swipe left
              //     if (index < controller.imagePaths.length - 1) {
              //       controller.currentImageIndex.value++;
              //     }
              //   }
              // },
              child: Image.file(File(controller.imagePaths[index])),
            );
          },
        ),
        bottomSheet: Visibility(
          visible: controller.showBottomSheet.value,
          child: Container(
            padding: const EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * 0.1,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.share_outlined,
                    ),
                    Text("Share"),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.edit_outlined,
                    ),
                    Text("Edit"),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.filter_center_focus_rounded,
                    ),
                    Text("Google Lens"),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.more_vert,
                    ),
                    Text("More"),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
