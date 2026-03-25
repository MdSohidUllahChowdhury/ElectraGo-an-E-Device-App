import 'package:ElectraGo/Service/service.dart';
import 'package:ElectraGo/View/Intro%20Screen/login.dart';
import 'package:ElectraGo/View/Main%20Screen/mainscreen.dart';

import 'welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //splashscreen();
    _checkLoginStatus();
  }

   Future<void> _checkLoginStatus() async {
    // Small delay so splash screen is visible
    await Future.delayed(const Duration(seconds: 2));

    final isLoggedIn = await StorageService.isLoggedIn();

    if (mounted) {
      if (isLoggedIn) {
        // ✅ Token exists — go straight to home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainScreen()),
        );
      } else {
        // ❌ No token — go to login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Login()),
        );
      }
    }
  }

  splashscreen() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Get.offAll(() => const WelcomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: const Center(
        child: Text(
          'MONEY OR LOVE\nBRAIN OR HEART',
          style: TextStyle(
              color: Color(0xff42D674),
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.4),
        ),
      ),
    );
  }
}
