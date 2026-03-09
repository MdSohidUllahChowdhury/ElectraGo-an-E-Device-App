import 'package:ElectraGo/View/Main Screen/mainscreen.dart';
import 'package:ElectraGo/Widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSet extends StatelessWidget {
  const ProfileSet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Profile Setup',
            style: TextStyle(
              fontSize: 28,
              letterSpacing: 1.4,
              color: Color(0xff42D674),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Please fill be below details to complete\nyour profile",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 11,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4),
          ),
          const SizedBox(height: 55),
          Stack(alignment: Alignment.bottomRight, children: [
            CircleAvatar(
              radius: 50,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  size: 60,
                ),
              ),
            ),
            CircleAvatar(
              radius: 17,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.camera_alt,
                  size: 10,
                ),
              ),
            ),
          ]),
          const SizedBox(height: 25),
          const SectionName(nameit: 'Full Name'),
          const SizedBox(height: 25),
          const SectionName(
            nameit: 'Phone Number',
          ),
          const SizedBox(height: 25),
          const SectionName(
            nameit: 'Address',
          ),
          const SizedBox(height: 35),
          ElevatedButton(
            onPressed: () => Get.to(() => const MainScreen()),
            style: ButtonStyle(
              elevation: const WidgetStatePropertyAll(0),
              minimumSize: WidgetStateProperty.all<Size>(const Size(380, 60)),
              backgroundColor: WidgetStateProperty.all<Color>(
                const Color(0xff42D674),
              ),
            ),
            child: const Text(
              'Complete Setup',
              style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 1.2,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
