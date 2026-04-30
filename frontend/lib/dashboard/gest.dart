import 'package:flutter/material.dart';

class Gest extends StatefulWidget {
  const Gest({super.key});

  @override
  State<Gest> createState() => _GestState();
}

class _GestState extends State<Gest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('G E S T   P A N E L'),
      ),
      body: const Center(
        child: Text(
          "Welcome Guest",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
