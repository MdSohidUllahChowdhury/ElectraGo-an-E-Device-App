import 'package:flutter/material.dart';

class SectionName extends StatelessWidget {
  final String nameit;
  final dynamic controllerText;
  final bool? forpassword;
  final bool? isRequired;

  const SectionName(
      {super.key,
      this.controllerText,
      required this.nameit,
      this.forpassword,
      this.isRequired});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: controllerText,
        validator: isRequired == true
            ? (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Fill the section!';
                } else {
                  return null;
                }
              }
            : null,
        obscureText: forpassword ?? false,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(213, 190, 186, 186),
          hintText: nameit,
          hintStyle: const TextStyle(
              fontSize: 12, color: Colors.black, letterSpacing: 1.4),
          contentPadding: const EdgeInsets.all(17),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
