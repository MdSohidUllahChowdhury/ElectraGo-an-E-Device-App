import 'package:ElectraGo/Service/service.dart';
import 'package:ElectraGo/View/Intro%20Screen/login.dart';
import 'package:ElectraGo/View/Setting%20Screen/language.dart';
import 'package:ElectraGo/View/Setting%20Screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customDrawer() {
  return Drawer(
      elevation: 50,
      backgroundColor: Colors.black54,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            radius: 50,
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
            leading: const Icon(Icons.person, color: Colors.white),
            title: const Text('P r o f i l e',
                style: TextStyle(color: Colors.white)),
            hoverColor: Colors.white,
          ),
          ListTile(
            onTap: () => Get.bottomSheet(language()),
            leading: Icon(Icons.language_rounded,
                color: Colors.greenAccent.shade400),
            title: const Text('L a n g u a g e',
                style: TextStyle(color: Colors.white)),
            hoverColor: Colors.white,
          ),
          ListTile(
            onTap: () => Get.back(),
            leading: const Icon(Icons.settings, color: Colors.white),
            title: const Text('S e t t i n g',
                style: TextStyle(color: Colors.white)),
            hoverColor: Colors.white,
          ),
          ListTile(
            onTap: () async {
              await StorageService.deleteToken();
              Get.offAll(() => const Login());
            },
            leading: const Icon(Icons.logout_outlined, color: Colors.white),
            title: const Text('L o g  O u t',
                style: TextStyle(color: Colors.white)),
            hoverColor: Colors.white,
          ),
        ],
      ));
}
