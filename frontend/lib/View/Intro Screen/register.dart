import 'package:ElectraGo/Api/nodejs_path.dart';

import 'login.dart';
import 'package:ElectraGo/Widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailCL = TextEditingController();
  final passwordCL = TextEditingController();

  //  @override
  // void dispose() {
  //   emailCL.dispose();
  //   passwordCL.dispose();
  // }

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
            'Create Your Account',
            style: TextStyle(
              fontSize: 32,
              letterSpacing: 1.4,
              color: Color(0xff42D674),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Create an account so you can explore all the\nexisting device",
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
                SectionName(
                  controllerText: emailCL,
                  nameit: 'Email',
                  isRequired: true,
                ),
                const SizedBox(height: 25),
                SectionName(
                  controllerText: passwordCL,
                  nameit: 'Password',
                  forpassword: true,
                  isRequired: true,
                ),
                const SizedBox(height: 25),
                SectionName(
                  controllerText: passwordCL,
                  nameit: 'Confirm password',
                  forpassword: true,
                  isRequired: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      final data = {
                        "email": emailCL.text,
                        "password": passwordCL.text,
                      };
                      print("Sending data: $data");

                      await API.postRequest(data);

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Data Save"),
                          backgroundColor: Colors.teal,
                        ),
                      );
                      //Get.offAll(() => const Login());
                    }
                  },
                  style: ButtonStyle(
                    elevation: const WidgetStatePropertyAll(0),
                    minimumSize:
                        WidgetStateProperty.all<Size>(const Size(385, 60)),
                    backgroundColor: WidgetStateProperty.all<Color>(
                      const Color(0xff42D674),
                    ),
                  ),
                  child: const Text(
                    'Sing In',
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
            onPressed: () => Get.offAll(() => const Login()),
            child: const Text(
              'Already have an account?',
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
