import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget quantity() {
  var iteams = 1.obs;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        onPressed: () => iteams--,
        icon: const Icon(
          Icons.remove_circle,
          color: Colors.white70,
          size: 30,
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Obx(() => Text(
            'Quantity: $iteams',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 18,
                letterSpacing: 1.5,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          )),
      const SizedBox(
        width: 20,
      ),
      IconButton(
        onPressed: () => iteams++,
        icon: const Icon(
          Icons.add_circle,
          color: Colors.white70,
          size: 30,
        ),
      )
    ],
  );
}
