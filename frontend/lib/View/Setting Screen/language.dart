import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget language() {
  return Container(
    height: 280,
    width: 250,
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Change Language',
          style: TextStyle(
              fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.w700),
        ),
        const Divider(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.updateLocale(const Locale('Ban'));
                Get.snackbar('Successful', 'Your Language is Bangla',
                    duration: const Duration(seconds: 5),
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.all(10),
                    borderRadius: 16,
                    snackPosition: SnackPosition.TOP);
              },
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all<Size>(const Size(80, 45)),
                backgroundColor: WidgetStateProperty.all<Color>(Colors.teal),
              ),
              child: const Text(
                'Bangla',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.updateLocale(const Locale('Eng'));
                Get.snackbar('Successful', 'Your Language is English',
                    duration: const Duration(seconds: 5),
                    padding: const EdgeInsets.all(10),
                    borderRadius: 16,
                    snackPosition: SnackPosition.TOP);
              },
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all<Size>(const Size(80, 45)),
                backgroundColor: WidgetStateProperty.all<Color>(Colors.teal),
              ),
              child: const Text(
                'English',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            )
          ],
        )
      ],
    ),
  );
}
