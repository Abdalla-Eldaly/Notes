import 'package:flutter/material.dart';
import 'package:nota/constants/appTextStyle.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.textInputType, this.maxline=1,
  });
  final String hintText;
  final String labelText;
  final int maxline;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: TextField(
        maxLines:maxline ,
        cursorColor: Colors.grey,

        keyboardType: textInputType,
        decoration: InputDecoration(

          focusColor: Colors.green,
          hintText: hintText,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey.withOpacity(.6),fontWeight: FontWeight.w500),
          // border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(Colors.grey.shade500),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([Color]) {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: BorderSide(color:Color?? Colors.grey));
  }
}
