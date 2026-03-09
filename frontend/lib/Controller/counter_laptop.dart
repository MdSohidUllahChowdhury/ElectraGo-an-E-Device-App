import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget quantity() {
  var iteams = 1.obs;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        onPressed: () => iteams--,
        icon: const Icon(Icons.remove_circle),
      ),
      const SizedBox(
        width: 20,
      ),
      Obx(() => Text(
            'Quantity\n$iteams',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 12,
                letterSpacing: 1.5,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          )),
      const SizedBox(
        width: 20,
      ),
      IconButton(
        onPressed: () => iteams++,
        icon: const Icon(Icons.add_circle),
      )
    ],
  );
}