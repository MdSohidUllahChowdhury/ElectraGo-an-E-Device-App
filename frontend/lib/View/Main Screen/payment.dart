import 'package:ElectraGo/Widgets/bank_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PaymentMethod extends StatelessWidget {
  String image, productName, price;
  PaymentMethod(
      {super.key,
      required this.image,
      required this.productName,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[400],
                child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.keyboard_double_arrow_up,
                      size: 25,
                      color: Colors.black,
                    )),
              ),
              title: const Text(
                "Checkout",
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.sizeOf(context).height * .28,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  gradient: LinearGradient(
                      colors: [Color(0xffA280C1), Color(0xff4D0A8E)])),
              child: Row(
                children: [
                  Image.asset(
                    image,
                    height: 180,
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        productName,
                        style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            letterSpacing: 1.3),
                      ),
                      subtitle: Text(
                        "$price | including tax and diutes",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 1.3),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Divider(
              height: 25,
              color: Color(0xff42D674),
              thickness: 13,
            ),
            const Divider(
              color: Colors.redAccent,
              thickness: 13,
            ),
            const SizedBox(
              height: 15,
            ),
            const Align(
                alignment: Alignment.topLeft,
                child: Text(" Select Your Payment Methods",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        letterSpacing: 1.3))),
            const SizedBox(height: 15),
            bankCard(context),
            const Expanded(child: SizedBox(height: 15)),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                elevation: const WidgetStatePropertyAll(0),
                minimumSize: WidgetStateProperty.all<Size>(const Size(320, 55)),
                backgroundColor:
                    WidgetStateProperty.all<Color>(const Color(0xff42D674)),
              ),
              child: const Text(
                'Finalize Purchase',
                style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1.5,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}
