import 'package:flutter/material.dart';

class CategorisIcon extends StatelessWidget {
  final Icon icons;
  const CategorisIcon({super.key, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: CircleAvatar(
        backgroundColor: Colors.white.withValues(alpha: 0.3),
        radius: 30,
        child: CircleAvatar(
          backgroundColor: Colors.pinkAccent.shade400.withValues(alpha: 0.6),
          radius: 25,
          child: icons,
        ),
      ),
    );
  }
}
