import 'package:ElectraGo/Controller/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget payBill(brandName, price, image) {
  return ElevatedButton(
    onPressed: () {
      Get.bottomSheet(
        Utils.innerPayBill(price, brandName, image),
      );
    },
    style: ButtonStyle(
      elevation: const WidgetStatePropertyAll(0),
      minimumSize: WidgetStateProperty.all<Size>(const Size(300, 55)),
      backgroundColor: WidgetStateProperty.all<Color>(const Color(0xff42D674)),
    ),
    child: const Text(
      'Buy Now',
      style: TextStyle(
          fontSize: 18,
          letterSpacing: 1.5,
          color: Colors.black,
          fontWeight: FontWeight.w600),
    ),
  );
}
