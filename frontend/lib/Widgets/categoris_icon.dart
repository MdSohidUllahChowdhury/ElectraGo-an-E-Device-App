import 'package:flutter/material.dart';

class CategorisIcon extends StatelessWidget {
  final Icon icons;
  const CategorisIcon({super.key, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: CircleAvatar(
        backgroundColor: const Color(0xff80EF80),
        radius: 28,
        child: icons,
      ),
    );
  }
}
