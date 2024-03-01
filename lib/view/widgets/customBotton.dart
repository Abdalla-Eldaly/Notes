import 'package:flutter/material.dart';
import 'package:nota/constants/appTextStyle.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey,

      ),
      child: Center(child: Text('Save',style: TextAppStyle.btnStyle(),),),

    );
  }
}
