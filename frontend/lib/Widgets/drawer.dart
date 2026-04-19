import 'package:ElectraGo/View/Intro%20Screen/login.dart';
import 'package:ElectraGo/View/Setting%20Screen/language.dart';
import 'package:ElectraGo/View/Setting%20Screen/profile.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
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
              child: Image(
                  image: NetworkImage(
                      'https://avatars.githubusercontent.com/u/157578225?s=400&u=964b4d9c7a4c30ece9f6588c3886f9d9f10bbc20&v=4'))
              // Icon(
              //   Icons.person_3,
              //   size: 50,
              // ),
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
            leading: const Icon(Icons.language_rounded, color: Colors.white),
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
            onTap: () => AwesomeDialog(
              context: Get.context!,
              width: 500,
              dialogType: DialogType.warning,
              animType: AnimType.bottomSlide,
              title: 'Are you sure you want to log out?',
              btnCancelOnPress: () {},
              btnOkOnPress: () {
                Get.offAll(() => const Login());
              },
            ).show(),
            leading: const Icon(Icons.logout_outlined, color: Colors.white),
            title: const Text('L o g  O u t',
                style: TextStyle(color: Colors.white)),
            hoverColor: Colors.white,
          ),
        ],
      ));
}
