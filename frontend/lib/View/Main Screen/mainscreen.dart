import 'package:ElectraGo/Controller/utils.dart';
import 'package:ElectraGo/View/Main%20Screen/cart_items.dart';
import 'package:ElectraGo/Widgets/ads_bord.dart';
import 'package:ElectraGo/Widgets/drawer.dart';
import 'package:ElectraGo/Widgets/product_add_on.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Get.snackbar(
                  'Developing Mood', 'Currently Working on this Option');
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => const CartItems());
            },
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      drawer: customDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Text(
                'Wel'.tr,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                "Sub".tr,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(136, 0, 0, 0),
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 20),
              const AdsBord(),
              const SizedBox(height: 15),
              Utils.seeAllAndCategory(),
              const SizedBox(height: 15),
              Utils.iconOfCategory(),
              const SizedBox(height: 15),
              const ProductAddON(),
            ],
          ),
        ),
      ),
    );
  }
}
