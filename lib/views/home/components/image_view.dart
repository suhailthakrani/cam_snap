import 'dart:io';

import 'package:cam_snap/controllers/home_camera_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageView extends GetView<HomeController> {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
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
              // TODO: Add data of file creation and take the from file name
              //
              // "${controller.getWordMonth(dateTime.month)} ${dateTime.day}, ${dateTime.year}",
              "${dateTime.day}-${dateTime.month}, ${dateTime.year}",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Text(
              "${dateTime.hour}:${dateTime.minute}",
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
            onPressed: () {},
            icon: const Icon(
              Icons.whatshot_sharp,
              color: Colors.green,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Center(
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Image.file(
                File(
                  controller.recentCapturedImage.value,
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
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
    );
  }
}
