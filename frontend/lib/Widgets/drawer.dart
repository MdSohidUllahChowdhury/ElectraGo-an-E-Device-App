import 'package:ElectraGo/Service/service.dart';
import 'package:ElectraGo/View/Intro%20Screen/login.dart';
import 'package:ElectraGo/View/Setting%20Screen/language.dart';
import 'package:ElectraGo/View/Setting%20Screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customDrawer() {
  return Drawer(
      elevation: 50,
      backgroundColor: Colors.white,
      width: 225,
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 60,
            child: Icon(
              Icons.person_3,
              size: 50,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          ListTile(
            onTap: () => Get.to(() => const ProfileSet()),
            leading: const Icon(Icons.person),
            title: const Text('P r o f i l e'),
            hoverColor: Colors.white,
          ),
          ListTile(
            onTap: () => Get.bottomSheet(language()),
            leading: Icon(Icons.language_rounded,
                color: Colors.greenAccent.shade400),
            title: const Text('L a n g u a g e'),
            hoverColor: Colors.white,
          ),
          ListTile(
            onTap: () => Get.back(),
            leading: const Icon(Icons.settings),
            title: const Text('S e t t i n g'),
            hoverColor: Colors.white,
          ),
          ListTile(
            onTap: () async {
              await StorageService.deleteToken();
              Get.offAll(() => const Login());
            },
            leading: const Icon(Icons.logout_outlined),
            title: const Text('L o g  O u t'),
            hoverColor: Colors.white,
          ),
        ],
      ));
}
