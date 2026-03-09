import 'package:ElectraGo/View/Setting Screen/profile.dart';
import 'register.dart';
import 'package:ElectraGo/Widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('lib/Assets/Images/logo.jpg'),
            height: 260,
            width: double.infinity,
          ),
          const Text(
            'Login Here',
            style: TextStyle(
              fontSize: 32,
              letterSpacing: 1.4,
              color: Color(0xff42D674),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Welcome back you've\nbeen missed!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4),
          ),
          const SizedBox(height: 55),
          Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SectionName(
                  nameit: 'Email',
                  isRequired: true,
                ),
                const SizedBox(height: 25),
                const SectionName(
                  nameit: 'Password',
                  forpassword: true,
                  isRequired: true,
                ),
                const SizedBox(height: 13),
                const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Forgot your password?         ',
                    style: TextStyle(
                        fontSize: 11,
                        color: Color(0xff42D674),
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.4),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      Get.to(() => const ProfileSet());
                    }
                  },
                  style: ButtonStyle(
                    elevation: const WidgetStatePropertyAll(0),
                    minimumSize:
                        WidgetStateProperty.all<Size>(const Size(380, 60)),
                    backgroundColor: WidgetStateProperty.all<Color>(
                      const Color(0xff42D674),
                    ),
                  ),
                  child: const Text(
                    'Sing in',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => Get.to(() => const Register()),
            child: const Text(
              'Create a new account',
              style: TextStyle(
                  fontSize: 11,
                  decoration: TextDecoration.underline,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
