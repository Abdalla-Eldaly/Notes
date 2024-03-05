import 'package:flutter/material.dart';

import 'customSearchIcon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title, required this.iconData,  this.onPressed});
  final String title;
  final IconData iconData;
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text( title,style: const TextStyle(fontSize: 28),),
        const Spacer(),
        CustomSearchIcon(icon: iconData,onPressed: onPressed,)

      ],
    );
  }
}
