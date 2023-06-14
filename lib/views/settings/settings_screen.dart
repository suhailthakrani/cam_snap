import 'package:cam_snap/controllers/settings_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/widgets/custom_tile.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: const Text("Settings"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          SizedBox(
            height: Get.height * 0.1,
            width: Get.width,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.mainTabIcons.length,
              itemBuilder: (context, index) {
                return mainTab(
                  color: index == 0? Colors.grey.shade800: Colors.grey.shade900,
                    icon: controller.mainTabIcons[index],
                    name: controller.mainTabNames[index]);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                width: 8,
              ),
            ),
          ),
          SizedBox(height: Get.height * 0.03,),
          CustomListTile(
            leading: const Icon(Icons.photo_outlined),
            onTap: () {},
            title: 'Pictre Size',
            subtitle: '20.5.9(7M) 3936x1728',
          ),
          CustomListTile(
            leading: const Icon(CupertinoIcons.timer),
            onTap: () {},
            title: 'Delay Capture',
            subtitle: 'Off',
          ),
          CustomListTile(
            leading: const Icon(Icons.location_on_outlined),
            onTap: () {},
            title: 'Location',
            trailing: Switch(
              
              value: false,
              onChanged: (value) {
                //
              },
            ),
          ),
          CustomListTile(
            leading: const Icon(Icons.data_saver_off),
            onTap: () {},
            title: 'Level',
            trailing: Switch(
              value: false,
              onChanged: (value) {
                //
              },
            ),
          ),
           CustomListTile(
            leading: const Icon(CupertinoIcons.timer),
            onTap: () {},
            title: 'Custom Volume Key',
            subtitle: 'Shutter',
          ),
           CustomListTile(
            leading: const Icon(Icons.storage_outlined),
            onTap: () {},
            title: 'Storage Path',
            subtitle: 'Internal Storage',
          ),
            CustomListTile(
            leading: const Icon(Icons.fingerprint),
            onTap: () {},
            title: 'Finger print Sensor as a shutter',
            trailing: Switch(
              value: false,
              onChanged: (value) {
                //
              },
            ),
          ),
            CustomListTile(
            leading: const Icon(Icons.restore_outlined),
            onTap: () {},
            title: 'Restore defaults',
            
          ),
        ],
      ),
    );
  }

  Widget mainTab({required IconData icon, required String name, required Color color}) {
    return Column(
      children: [
        Container(
          width: Get.width * 0.22,
          height: Get.width * 0.16,
          decoration: BoxDecoration(
            color: color,// Light gray background color
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          child: Center(
            child: Icon(
              icon, // Volume icon
              size: Get.width * 0.06,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Text(
            name,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.white54,
            ),
          ),
        ),
      ],
    );
  }
}
