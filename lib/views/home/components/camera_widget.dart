import 'dart:io';

import 'package:cam_snap/views/home/components/image_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_camera_controller.dart';

class CameraWidget extends StatelessWidget {
  const CameraWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        if (controller.isCameraLoaded.value) {
          if (controller.recentCapturedImage.value.isNotEmpty) {
            return const ImageView();
          }
         else { return CameraPreview(
            controller.cameraController!,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings_outlined,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.cameraController!
                                .setFlashMode(FlashMode.off);
                          },
                          icon: const Icon(
                            Icons.flash_off,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.hdr_off_sharp,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.aspect_ratio,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.color_filter,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          showBottomSheet(
                            // enableDrag: true,
                            backgroundColor:
                                Colors.transparent.withOpacity(0.6),
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pop(
                                      context); // Dismiss the bottom sheet
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(16),
                                  color: Colors.transparent,
                                  width: width,
                                  height: height * 0.5,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 5,
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          margin: const EdgeInsets.only(top: 5),
                                          height: 3,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: Colors.white),
                                        ),
                                      ),
                                      Expanded(
                                          child: GridView.count(
                                        shrinkWrap: true,
                                        crossAxisCount: 3,
                                        children: [
                                          cameraTypeWidget(
                                              "SLOW MOTION",
                                              Icon(
                                                CupertinoIcons
                                                    .square_stack_3d_down_dottedline,
                                                size: width * 0.09,
                                              )),
                                          cameraTypeWidget(
                                            "VIDEO",
                                            Icon(
                                              CupertinoIcons.videocam,
                                              size: width * 0.09,
                                            ),
                                          ),
                                          cameraTypeWidget(
                                            "AI CAM",
                                            Icon(
                                              CupertinoIcons.videocam,
                                              size: width * 0.09,
                                            ),
                                          ),
                                          cameraTypeWidget(
                                            "BEAUTIFY",
                                            Icon(
                                              CupertinoIcons.videocam,
                                              size: width * 0.09,
                                            ),
                                          ),
                                          cameraTypeWidget(
                                            "PORTRAIT",
                                            Icon(
                                              CupertinoIcons.videocam,
                                              size: width * 0.09,
                                            ),
                                          ),
                                          cameraTypeWidget(
                                            "AR SHOT",
                                            Icon(
                                              CupertinoIcons.videocam,
                                              size: width * 0.09,
                                            ),
                                          ),
                                          cameraTypeWidget(
                                            "PANORAMA",
                                            Icon(
                                              CupertinoIcons.videocam,
                                              size: width * 0.09,
                                            ),
                                          ),
                                          cameraTypeWidget(
                                            "DOCUMENTS",
                                            Icon(
                                              CupertinoIcons.videocam,
                                              size: width * 0.09,
                                            ),
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_up_rounded,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height: height * 0.08,
                        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                        alignment: Alignment.topCenter,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _tabWidget(text: "SLOW MOTION"),
                            _tabWidget(text: "VIDEO"),
                            _tabWidget(text: "AI CAM"),
                            _tabWidget(text: "BEAUTY"),
                            _tabWidget(text: "PORTRAIT"),
                            _tabWidget(text: "AR SHOT"),
                            _tabWidget(text: "PANORAMA"),
                            _tabWidget(text: "DOCUMENTS"),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: width * 0.12,
                            width: width * 0.12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white60,
                            ),
                            child: Obx(() {
                              return controller.recentCapturedImage.isNotEmpty
                                  ? InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, "/image_view");
                                      },
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: Image.file(
                                            File(controller
                                                .recentCapturedImage.value),
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const SizedBox();
                                            },
                                          )),
                                    )
                                  : const SizedBox();
                            }),
                          ),
                          InkWell(
                            onTap: () async {
                              await controller.captureImage();
                            },
                            child: Icon(
                              CupertinoIcons.camera_circle,
                              size: width * 0.2,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.switchCamera(1);
                            },
                            icon: Icon(
                              CupertinoIcons.switch_camera,
                              size: width * 0.08,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.1),
                    ],
                  ),
                )
              ],
            ),
          );}
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget cameraTypeWidget(String text, Icon icon) {
    return Column(
      children: [
        icon,
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        )
      ],
    );
  }

  Widget _tabWidget({required String text}) => Padding(
        padding: const EdgeInsets.only(right: 20, top: 8, bottom: 8),
        child: Text(text,
            style: const TextStyle(
              color: Colors.white,
            )),
      );
}
