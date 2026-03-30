import 'package:ElectraGo/Controller/counter_laptop.dart';
import 'package:ElectraGo/Controller/provider_cart.dart';
import 'package:ElectraGo/Model/device_model.dart';
import 'package:ElectraGo/Widgets/payment_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  final String productImage, brandName, offerPrice, noOfferPrice;
  const ProductDetails(
      {super.key,
      required this.productImage,
      required this.brandName,
      required this.offerPrice,
      required this.noOfferPrice});

  void addToCart(BuildContext context) {
    // Create a DeviceModel from the product details
    final device = DeviceModel(
      productPic: productImage,
      brandName: brandName,
      withOfferPrice: offerPrice,
      withOutOfferPrice: noOfferPrice,
      discount: "25%", // You can adjust this or pass it as parameter
    );

    // Add to cart using Provider
    final cartProvider = Provider.of<CartController>(context, listen: false);
    cartProvider.adtoCart(device);

    // Show success feedback
    Get.snackbar(
      'Added to Cart',
      '$brandName added to your cart',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.shade600,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 45,
        centerTitle: true,
        title: const Text(
          "Product Details",
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Animate(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * .25,
                child: Image.asset(
                  productImage,
                  height: 400,
                ),
              ),
            )
                .animate(autoPlay: true, delay: const Duration(seconds: 2))
                .shimmer(
                    curve: const Split(BorderSide.strokeAlignCenter),
                    duration: const Duration(seconds: 3)),
            Text(
              brandName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Colors.black,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: MediaQuery.sizeOf(context).height * .35,
              decoration: const BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 74, 75, 73),
                        blurStyle: BlurStyle.normal,
                        blurRadius: 8,
                        offset: Offset(8, 4))
                  ]),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          offerPrice,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                            letterSpacing: 1.1,
                          ),
                        ),
                        Text(
                          noOfferPrice,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                              letterSpacing: 1.1,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 25,
                    color: Colors.white,
                    thickness: 13,
                  ),
                  const Divider(
                    color: Colors.redAccent,
                    thickness: 13,
                  ),
                  const Text(
                    ' \nKey Features :\n\n MPN: 973R0PA\n Model: 15-fd0205TU\n Processor: Intel Core i5-1335U (up to 4.6 GHz, 12 MB L3 cache)\n RAM: 8 GB DDR4 3200MHz, Storage: 512GB PCIe M.2 SSD\n Display: 15.6" FHD (1920 x 1080)\n Features: Type-C, Wi-Fi 6, Privacy Shutter, Mic Mute Key',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 1.1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            quantity(),
            const Expanded(child: SizedBox(height: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                payBill(brandName, offerPrice, productImage),
                CircleAvatar(
                  backgroundColor: Colors.black87,
                  radius: 26,
                  child: IconButton(
                    onPressed: () {
                      addToCart(context);
                    },
                    icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}
