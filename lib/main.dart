import 'package:cam_snap/controllers/home_camera_controller.dart';
import 'package:cam_snap/views/home/components/image_view.dart';
import 'package:cam_snap/views/settings/settings_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
     initialRoute: "/",
      routes: {
        "/":(context) => const HomeScreen(),
        "/image_view":(context) => const ImageView(),
         "/settings":(context) => const SettingsScreen(),
        
      },
    );
  }
}
