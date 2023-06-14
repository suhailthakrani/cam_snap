import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {

  List<String> mainTabNames = [
    "Shutter Sound",
    "Grid",
    "Touch Capture",
    "Auto watermark",
  ];
  List<IconData> mainTabIcons = [
    Icons.volume_up_outlined,
    Icons.grid_3x3_outlined,
    Icons.touch_app_outlined,
    Icons.person_2_outlined
  ];

}