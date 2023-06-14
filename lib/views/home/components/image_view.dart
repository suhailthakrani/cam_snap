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
         backgroundColor: Colors.black87,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Stack(
            // crossAxisAlignment: CrossAxisAlignment.start,
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
            List<String> imagePaths =List.from( controller.imagePaths.reversed);
            return GestureDetector(
              onVerticalDragEnd: (details) =>
                  controller.showBottomSheet.value = true,
              onVerticalDragStart: (details) =>
                  controller.showBottomSheet.value = false,
              child: Image.file(
                File(imagePaths[index]),
                height: Get.height,
                fit: BoxFit.fitHeight,
                width: MediaQuery.of(context).size.width,
              ),
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
                      CupertinoIcons.delete,
                    ),
                    Text("Delete"),
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
