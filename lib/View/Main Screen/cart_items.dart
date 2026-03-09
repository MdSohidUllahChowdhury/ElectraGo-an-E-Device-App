import 'package:ElectraGo/Controller/provider_cart.dart';
import 'package:ElectraGo/Widgets/custom_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE3F0A3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 45,
        centerTitle: true,
        title: const Text('Favorite Items'),
      ),
      body: Consumer<CartController>(
        builder: (context, value, child) => Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: value.callingCart.length,
                itemBuilder: (context, index) {
                  return CustomCart(item: value.callingCart[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
