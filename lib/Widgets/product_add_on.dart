import 'package:ElectraGo/Controller/provider_cart.dart';
import 'package:ElectraGo/Model/product_list.dart';
import 'package:ElectraGo/View/Main Screen/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ProductAddON extends StatelessWidget {
  const ProductAddON({super.key});

  @override
  Widget build(BuildContext context) {
    final product = productList;
    final provider = Provider.of<CartController>(context, listen: false);

    return GridView.builder(
      itemCount: product.length,
      shrinkWrap: true,
      primary: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          childAspectRatio: .87),
      itemBuilder: (context, index) {
        final iteam = product[index];
        return InkWell(
          onTap: () => Get.to(() => ProductDetails(
                productImage: iteam.productPic,
                brandName: iteam.brandName,
                offerPrice: iteam.withOfferPrice,
                noOfferPrice: iteam.withOutOfferPrice,
              )),
          child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff42D674),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Animate(
                child: Stack(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        iteam.productPic,
                        height: 130,
                      ),
                      Text(
                        iteam.brandName,
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: 1.1,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              iteam.withOfferPrice,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                                letterSpacing: 1.1,
                              ),
                            ),
                            Text(
                              iteam.withOutOfferPrice,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent,
                                  letterSpacing: 1.1,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        height: 13,
                        width: 55,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(253, 255, 255, 255),
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          iteam.discount,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            color: Colors.redAccent,
                            letterSpacing: 1.1,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.snackbar(
                                'Added to the cart', 'Favorit item added',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor:
                                    const Color.fromARGB(209, 189, 167, 167));
                            provider.adtoCart(iteam);
                          },
                          icon: const Icon(
                            Icons.favorite_border,
                            size: 15,
                          )),
                    ],
                  ),
                ]),
              ).animate().flip().shimmer(
                  duration: const Duration(seconds: 3), color: Colors.white)),
        );
      },
    );
  }
}
