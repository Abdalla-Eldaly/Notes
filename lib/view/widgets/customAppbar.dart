import 'package:flutter/material.dart';

import 'customSearchIcon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title, required this.iconData});
  final String title;
  final IconData iconData;


  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text( title,style: const TextStyle(fontSize: 28),),
        const Spacer(),
        CustomSearchIcon(icon: iconData,)

      ],
    );
  }
}
