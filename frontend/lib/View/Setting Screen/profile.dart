import 'package:ElectraGo/Api/nodejs_path.dart';
import 'package:ElectraGo/View/Main Screen/mainscreen.dart';
import 'package:ElectraGo/Widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSet extends StatefulWidget {
  const ProfileSet({super.key});

  @override
  State<ProfileSet> createState() => _ProfileSetState();
}

class _ProfileSetState extends State<ProfileSet> {
  final _fullName = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Profile Setup',
              style: TextStyle(
                fontSize: 28,
                letterSpacing: 1.4,
                color: Color(0xff42D674),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Please fill be below details to complete\nyour profile",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 11,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.4),
            ),
            const SizedBox(height: 35),
            Stack(alignment: Alignment.bottomRight, children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person,
                    size: 90,
                    color: Colors.white,
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.amberAccent,
                radius: 17,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt,
                    size: 17,
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 25),
            SectionName(
              nameit: 'Full name',
              controllerText: _fullName,
              forPassword: false,
              fieldType: FieldType.username,
            ),
            const SizedBox(height: 25),
            SectionName(
              nameit: 'Phone',
              controllerText: _phoneNumber,
              forPassword: false,
              fieldType: FieldType.general,
            ),
            const SizedBox(height: 25),
            SectionName(
              nameit: 'Address',
              controllerText: _address,
              forPassword: false,
              fieldType: FieldType.general,
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  final data = {
                    'full_name': _fullName.text,
                    'phone_number': _phoneNumber.text,
                    'address': _address.text
                  };
                  await API.postProfileData(data);
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Data Save"),
                      backgroundColor: Colors.teal,
                    ),
                  );
                  print('req from flutter: $data');
                  Get.to(() => const MainScreen());
                }
              },
              style: ButtonStyle(
                elevation: const WidgetStatePropertyAll(0),
                minimumSize: WidgetStateProperty.all<Size>(const Size(385, 60)),
                backgroundColor: WidgetStateProperty.all<Color>(
                  const Color(0xff42D674),
                ),
              ),
              child: const Text(
                'Complete Setup',
                style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 1.2,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
