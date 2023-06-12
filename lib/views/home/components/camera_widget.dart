import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../controllers/home_controller.dart';

class CameraWidget extends StatelessWidget {
  const CameraWidget({
    super.key,
    required this.controller,
    required this.height,
    required this.width,
  });

  final HomeController controller;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CameraPreview(
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
                    onPressed: () {},
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
                      backgroundColor: Colors.transparent.withOpacity(0.6),
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // Dismiss the bottom sheet
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
                                        borderRadius: BorderRadius.circular(8),
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
                          color: Colors.green),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 28,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 22,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 20,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 18,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.switchCamer(1);

                        controller.refresh();
                      },
                      icon: const Icon(
                        CupertinoIcons.switch_camera,
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
