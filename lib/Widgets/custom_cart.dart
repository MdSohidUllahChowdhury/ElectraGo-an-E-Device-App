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
                  height: 100,
                  decoration: BoxDecoration(
                      color: const Color(0xff42D674),
                      borderRadius: BorderRadius.circular(24),
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
                                fontFamily: 'Bold',
                                fontSize: 14,
                                color: Colors.black),
                          ),
                          Text(
                            item.withOfferPrice,
                            style: const TextStyle(
                                fontFamily: 'Bold',
                                fontSize: 12,
                                color: Colors.black),
                          ),
                          const Text(
                            'Reating: ⭐ 4.6',
                            style: TextStyle(
                                fontFamily: 'Bold',
                                fontSize: 10,
                                color: Colors.black),
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
