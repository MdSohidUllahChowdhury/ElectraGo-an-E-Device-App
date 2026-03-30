import 'package:ElectraGo/View/Main%20Screen/payment.dart';
import 'package:ElectraGo/Widgets/categoris_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static innerPayBill(cost, brandName, image) {
    return Container(
        height: 300,
        width: MediaQuery.of(Get.context!).size.width * .9,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Product Details\n-----------------------',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              brandName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text('Price: $cost',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  letterSpacing: 1.1,
                )),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => PaymentMethod(
                      productName: brandName,
                      price: cost,
                      image: image,
                    ));
              },
              style: ButtonStyle(
                elevation: const WidgetStatePropertyAll(0),
                minimumSize: WidgetStateProperty.all<Size>(const Size(220, 55)),
                backgroundColor:
                    WidgetStateProperty.all<Color>(const Color(0xff42D674)),
              ),
              child: const Text(
                'Pay Bill',
                style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1.4,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ));
  }

  static seeAllAndCategory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Categoris'.tr,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            letterSpacing: 1.2,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'See'.tr,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.blue,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ],
    );
  }

  static iconOfCategory() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategorisIcon(
              icons: Icon(
            Icons.watch,
            color: Colors.white,
          )),
          CategorisIcon(
              icons: Icon(
            Icons.shopping_basket_rounded,
            color: Colors.white,
          )),
          CategorisIcon(
              icons: Icon(
            Icons.phone_android_sharp,
            color: Colors.white,
          )),
          CategorisIcon(
              icons: Icon(
            Icons.bike_scooter,
            color: Colors.white,
          )),
          CategorisIcon(
              icons: Icon(
            Icons.laptop,
            color: Colors.white,
          )),
          CategorisIcon(
              icons: Icon(
            Icons.shopping_basket_rounded,
            color: Colors.white,
          )),
          CategorisIcon(
              icons: Icon(
            Icons.phone_android_sharp,
            color: Colors.white,
          )),
          CategorisIcon(
              icons: Icon(
            Icons.bike_scooter,
            color: Colors.white,
          )),
          CategorisIcon(
              icons: Icon(
            Icons.laptop,
            color: Colors.white,
          )),
        ],
      ),
    );
  }
}
