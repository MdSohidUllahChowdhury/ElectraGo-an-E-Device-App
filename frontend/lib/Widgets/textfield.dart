import 'package:flutter/material.dart';

enum FieldType {
  username,
  email,
  password,
  general,
}

class SectionName extends StatelessWidget {
  final String nameit;
  final TextEditingController? controllerText;
  final FieldType fieldType;
  final bool forPassword;

  const SectionName({
    super.key,
    required this.nameit,
    required this.fieldType,
    this.controllerText,
    this.forPassword = false,
  });

  // ─────────────────────────────────────────────────────────
  // All validators live here — one place, easy to update
  // ─────────────────────────────────────────────────────────
  String? _validate(String? value) {
    // Every field — check not empty first
    if (value == null || value.trim().isEmpty) {
      return '$nameit is required';
    }

    switch (fieldType) {
      // ── Username ────────────────────────────────────────
      case FieldType.username:
        if (value.trim().length < 2) {
          return 'Username must be at least 2 characters';
        }
        if (value.trim().length > 15) {
          return 'Username must be less than 15 characters';
        }
        return null;

      // ── Email ────────────────────────────────────────────
      case FieldType.email:
        final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegex.hasMatch(value.trim())) {
          return 'Please enter a valid email';
        }
        return null;

      // ── Password ─────────────────────────────────────────
      case FieldType.password:
        if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }
        if (!value.contains(RegExp(r'[A-Z]'))) {
          return 'Must contain at least one uppercase letter';
        }
        if (!value.contains(RegExp(r'[a-z]'))) {
          return 'Must contain at least one lowercase letter';
        }
        if (!value.contains(RegExp(r'[0-9]'))) {
          return 'Must contain at least one number';
        }
        return null;

      // ── General — just not empty ──────────────────────────
      case FieldType.general:
        return null; //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: controllerText,
        obscureText: forPassword,
        validator: _validate,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(213, 190, 186, 186),
          hintText: nameit,
          hintStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            letterSpacing: 1.4,
          ),
          contentPadding: const EdgeInsets.all(17),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
        ),
      ),
    );
  }
}
