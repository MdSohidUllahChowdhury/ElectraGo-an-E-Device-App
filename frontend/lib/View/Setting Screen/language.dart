import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget language() {
  return Container(
    height: 280,
    width: MediaQuery.of(Get.context!).size.width * 0.8,
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Change Language 🌍',
          style: TextStyle(
              fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.w700),
        ),
        const Divider(
          height: 50,
          color: Colors.black,
          thickness: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.updateLocale(const Locale('Ban'));
                Get.snackbar('Successful', 'Your Language is Bangla',
                    colorText: Colors.white,
                    backgroundColor: const Color(0xff222F3A),
                    duration: const Duration(seconds: 1),
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(10),
                    borderRadius: 16,
                    snackPosition: SnackPosition.TOP);
              },
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all<Size>(const Size(150, 45)),
                backgroundColor:
                    WidgetStateProperty.all<Color>(const Color(0xff222F3A)),
              ),
              child: const Text(
                'Bangla',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.updateLocale(const Locale('Eng'));
                Get.snackbar('Successful', 'Your Language is English',
                    colorText: Colors.white,
                    backgroundColor: const Color(0xff222F3A),
                    duration: const Duration(seconds: 1),
                    padding: const EdgeInsets.all(15),
                    borderRadius: 16,
                    snackPosition: SnackPosition.TOP);
              },
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all<Size>(const Size(150, 45)),
                backgroundColor:
                    WidgetStateProperty.all<Color>(const Color(0xff222F3A)),
              ),
              child: const Text(
                'English',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            )
          ],
        )
      ],
    ),
  );
}
