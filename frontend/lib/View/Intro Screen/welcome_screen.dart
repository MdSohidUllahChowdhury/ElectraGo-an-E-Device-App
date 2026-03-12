import 'login.dart';
import 'register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Animate(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'lib/Assets/Images/logo.jpg',
            height: 300,
            width: double.infinity,
          ),
          const SizedBox(height: 30),
          const Text(
            'Discover Your\nDream Device Here',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 27,
                color: Color(0xff42D674),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4),
          ),
          const SizedBox(height: 15),
          const Center(
            child: Center(
              child: Text(
                'Explore all the existing devices based on your\ninterest and yor perfection',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.4),
              ),
            ),
          ),
          const SizedBox(height: 45),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => Get.to(() => const Login()),
                style: ButtonStyle(
                  elevation: const WidgetStatePropertyAll(0),
                  minimumSize:
                      WidgetStateProperty.all<Size>(const Size(140, 45)),
                  backgroundColor: WidgetStateProperty.all<Color>(
                    const Color(0xff42D674),
                  ),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 1.2,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const Register());
                },
                style: ButtonStyle(
                  elevation: const WidgetStatePropertyAll(0),
                  minimumSize:
                      WidgetStateProperty.all<Size>(const Size(140, 45)),
                  backgroundColor: WidgetStateProperty.all<Color>(
                      const Color.fromARGB(232, 187, 190, 192)),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    ).animate().flip(duration: const Duration(seconds: 1)).shimmer(
            color: Colors.white, duration: const Duration(seconds: 4)));
  }
}
