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
          return CameraPreview(
            controller.cameraController!,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.1),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                "/settings",
                              );
                            },
                            icon: const Icon(
                              Icons.settings_outlined,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.changeFlashMode();
                            },
                            icon: Icon(
                              getFlashIcon(controller.currentFlashMode.value),
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
                            onPressed: () {
                              controller.isRatioPressed.value =
                                  !controller.isRatioPressed.value;
                              print(controller.isRatioPressed);
                            },
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
                ),
                Obx(
                  () => Visibility(
                    visible: controller.isRatioPressed.value,
                    child: Positioned(
                        top: height * 0.16,
                        left: 16,
                        right: 16,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.aspect_ratio,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.aspect_ratio,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.aspect_ratio,
                              color: Colors.white,
                            ),
                          ],
                        )),
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
                              border:
                                  Border.all(color: Colors.white38, width: 1),
                              color: Colors.white38,
                            ),
                            child: Obx(() {
                              return controller.recentCapturedImage.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        List creationDate = [];
                                        controller
                                            .extractDateTime(
                                                string: controller
                                                    .recentCapturedImage.value)
                                            .then((value) {
                                          creationDate = value;
                                          Navigator.pushNamed(
                                              context, "/image_view",
                                              arguments: {
                                                "creationDateAndTime":
                                                    creationDate
                                              });
                                        });
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
                          getCaptureImageButton(controller),
                          IconButton(
                            onPressed: () async {
                              await controller.switchCamera();
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
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  InkWell getCaptureImageButton(HomeController controller) {
    return InkWell(
        onTap: () async {
          await controller.captureImage();
        },
        child: Container(
          width: width * 0.17,
          height: width * 0.17,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 6),
          ),
          child: ClipOval(
            child: Container(
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.green, width: 2),
              ),
              child: ClipOval(
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ));
  }

  IconData getFlashIcon(FlashMode currentFlashMode) {
    switch (currentFlashMode) {
      case FlashMode.auto:
        return Icons.flash_auto_outlined;
      case FlashMode.torch:
        return Icons.flash_on_outlined;
      case FlashMode.off:
        return Icons.flash_off_outlined;
      case FlashMode.always:
        return Icons.flash_auto_outlined;
      default:
        return Icons.flash_auto_outlined;
    }
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
