import 'package:ElectraGo/dashboard/admin.dart';
import 'package:ElectraGo/dashboard/gest.dart';
import 'package:flutter/material.dart';

class WhiteScreen extends StatefulWidget {
  const WhiteScreen({super.key});

  @override
  State<WhiteScreen> createState() => _WhiteScreenState();
}

class _WhiteScreenState extends State<WhiteScreen> {
  final admin = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: const Text("P A N E L"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Panel Board',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              key: formKey,
              controller: admin,
              decoration: const InputDecoration(
                  hint: Text("Enter registered email"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  filled: true,
                  fillColor: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  admin.text == "admin@gmail.com"
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Admin()))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Gest()));
                },
                child: const Text("C H E C K"))
          ],
        ),
      ),
    );
  }
}
