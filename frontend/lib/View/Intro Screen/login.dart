import 'package:ElectraGo/Api/nodejs_path.dart';
import 'package:ElectraGo/View/Setting Screen/profile.dart';
import 'register.dart';
import 'package:ElectraGo/Widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

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
                SectionName(
                  nameit: 'Email',
                  controllerText: _emailCtrl,
                  forPassword: false,
                  fieldType: FieldType.email,
                ),
                const SizedBox(height: 25),
                SectionName(
                  nameit: 'Password',
                  controllerText: _passwordCtrl,
                  forPassword: true,
                  fieldType: FieldType.password,
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
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      final data = {
                        "email": _emailCtrl.text.trim(),
                        "password": _passwordCtrl.text
                      };
                      bool isSuccess = await API.logIn(data);

                      if (isSuccess) {
                        Get.to(() => const ProfileSet());
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Wrong email or password. Try again!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
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
                    'Log In',
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
            onPressed: () async {
              Get.offAll(() => const Register());
            },
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
