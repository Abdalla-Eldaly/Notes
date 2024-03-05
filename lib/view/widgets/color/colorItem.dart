import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});

 final bool isActive ;
 final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive ?  CircleAvatar(
      backgroundColor: Colors.grey.shade700,
      radius: 44,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircleAvatar(
          radius: 42,
          backgroundColor: color,
        ),
      ),
    ):  CircleAvatar(
      radius: 38,
      backgroundColor: color,
    );
  }
}
