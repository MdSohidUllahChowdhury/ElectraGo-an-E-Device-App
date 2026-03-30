import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardModel {
  final String cardNumber;
  final String expiryDate;
  bool isSelected;

  CardModel({
    required this.cardNumber,
    required this.expiryDate,
    this.isSelected = false,
  });
}

class PaymentMethod extends StatefulWidget {
  final String image;
  final String productName;
  final String price;

  const PaymentMethod({
    super.key,
    required this.image,
    required this.productName,
    required this.price,
  });

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  late List<CardModel> cards;
  int selectedCardIndex = 0;

  @override
  void initState() {
    super.initState();
    cards = [
      CardModel(cardNumber: "**** 4965", expiryDate: "07/25", isSelected: true),
      CardModel(
          cardNumber: "**** 4779", expiryDate: "07/25", isSelected: false),
    ];
  }

  void selectCard(int index) {
    setState(() {
      for (int i = 0; i < cards.length; i++) {
        cards[i].isSelected = (i == index);
      }
      selectedCardIndex = index;
    });
  }

  void addNewCard() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final cardNumberCtrl = TextEditingController();
        final expiryCtrl = TextEditingController();

        return AlertDialog(
          title: const Text("Add New Card"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: cardNumberCtrl,
                decoration: InputDecoration(
                  hintText: "**** **** **** XXXX",
                  labelText: "Card Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: expiryCtrl,
                decoration: InputDecoration(
                  hintText: "MM/YY",
                  labelText: "Expiry Date",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (cardNumberCtrl.text.isNotEmpty &&
                    expiryCtrl.text.isNotEmpty) {
                  setState(() {
                    cards.add(
                      CardModel(
                        cardNumber: cardNumberCtrl.text,
                        expiryDate: expiryCtrl.text,
                        isSelected: false,
                      ),
                    );
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Card added successfully!")),
                  );
                }
              },
              child: const Text("Add Card"),
            ),
          ],
        );
      },
    );
  }

  void showPaymentSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle,
                  size: 60,
                  color: Colors.green.shade600,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Payment Done!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Your payment has been processed successfully",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Get.back();
                },
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(Colors.green.shade600),
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: const Text(
                  "Continue Shopping",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header with back arrow and title
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back_ios_new_rounded,
                      size: 28, color: Colors.black),
                ),
                const SizedBox(width: 20),
                const Text(
                  "Checkout",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Product Card
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Image
                        Image.asset(
                          widget.image,
                          height: 120,
                          width: 120,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 16),
                        // Product Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.productName,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    letterSpacing: 0.5),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.price,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    letterSpacing: 0.5),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "including tax and duties",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade600,
                                    letterSpacing: 0.3),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Payment Method Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Payment Method",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 16),
                        // Apple Pay Button
                        Container(
                          width: double.infinity,
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.apple, color: Colors.white, size: 24),
                              SizedBox(width: 8),
                              Text(
                                "Apple Pay",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Or divider
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                    height: 1, color: Colors.grey.shade300)),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                "or pay with card",
                                style: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 12),
                              ),
                            ),
                            Expanded(
                                child: Container(
                                    height: 1, color: Colors.grey.shade300)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Card Options
                        Column(
                          spacing: 12,
                          children: List.generate(
                            cards.length,
                            (index) {
                              final card = cards[index];
                              return GestureDetector(
                                onTap: () => selectCard(index),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: card.isSelected
                                          ? const Color(0xff5050F3)
                                          : Colors.grey.shade300,
                                      width: card.isSelected ? 2.5 : 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "VISA",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff1434CB)),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            card.cardNumber,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey.shade700),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            card.expiryDate,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey.shade700),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Container(
                                        width: 56,
                                        height: 56,
                                        decoration: BoxDecoration(
                                          color: card.isSelected
                                              ? const Color(0xff5050F3)
                                              : Colors.transparent,
                                          border: Border.all(
                                            color: card.isSelected
                                                ? const Color(0xff5050F3)
                                                : Colors.grey.shade300,
                                            width: 2,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: card.isSelected
                                              ? Colors.white
                                              : Colors.grey,
                                          size: 28,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Add new payment method
                        GestureDetector(
                          onTap: addNewCard,
                          child: Container(
                            width: double.infinity,
                            height: 56,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.shade400, width: 1.5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "+ ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Text(
                                  "Add new payment method",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        // Total Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            Text(
                              widget.price,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Confirm Button
                        ElevatedButton(
                          onPressed: showPaymentSuccess,
                          style: ButtonStyle(
                            elevation: const WidgetStatePropertyAll(0),
                            minimumSize: WidgetStateProperty.all<Size>(
                                const Size(double.infinity, 56)),
                            backgroundColor: WidgetStateProperty.all<Color>(
                                const Color(0xff2ECC71)),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Confirm & Pay Securely',
                            style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 0.5,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Footer
                        Center(
                          child: Text(
                            "🛡️  Secure checkout • All transactions protected",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
