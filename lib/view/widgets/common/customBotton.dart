import 'package:flutter/material.dart';
import 'package:nota/constants/appTextStyle.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key, this.onTap,  this.isLoading = false});
  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey,

        ),
        child: isLoading ? Center(child: SizedBox(
            width: 25,
            height: 25,
            child: const CircularProgressIndicator(color: Colors.black54,semanticsLabel: AutofillHints.addressCity,))) : Center(child: Text('Save',style: TextAppStyle.btnStyle(),),),

      ),
    );
  }
}
