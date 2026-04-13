import 'package:ElectraGo/Model/device_model.dart';
import 'package:ElectraGo/View/Main%20Screen/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomCart extends StatelessWidget {
  CustomCart({super.key, required this.item});

  DeviceModel item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetails(
            productImage: item.productPic,
            brandName: item.brandName,
            offerPrice: item.withOfferPrice,
            noOfferPrice: item.withOutOfferPrice));
      },
      child: Animate(
          child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  padding: const EdgeInsets.all(12),
                  height: 120,
                  decoration: BoxDecoration(
                      color: const Color(0xff222F3A),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2,
                            color: Colors.grey.shade400,
                            blurStyle: BlurStyle.outer,
                            offset: const Offset(1, 3)),
                      ]),
                  child: Row(
                    children: [
                      Image.asset(
                        item.productPic,
                        height: 100,
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            item.brandName,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white),
                          ),
                          Text(
                            item.withOfferPrice,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white),
                          ),
                          const Text(
                            'Reating: ⭐ 4.6',
                            style:
                                TextStyle(fontSize: 12, color: Colors.yellow),
                          ),
                        ],
                      )
                    ],
                  ))
              .animate()
              .flip(
                duration: const Duration(seconds: 1),
              )
              .shimmer(
                  color: Colors.white, duration: const Duration(seconds: 3))),
    );
  }
}
