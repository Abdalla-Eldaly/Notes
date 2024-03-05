import 'package:flutter/material.dart';
import 'package:nota/constants/appTextStyle.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
     this.labelText,
    this.textEditingController,
    required this.textInputType, this.maxline=1, this.onsave, this.onChanged,
  });
  final String hintText;
  final String? labelText;
  final int maxline;
  final TextInputType textInputType;
  final TextEditingController? textEditingController;
  final void Function(String?)? onsave;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        controller: textEditingController ,
        onChanged:onChanged ,
        validator: (value) {
          if(value?.isEmpty??true){
          return 'Failed is requiresd'  ;
          }else {
            return null;
          }
        },
        onSaved: onsave,
        maxLines:maxline ,
        cursorColor: Colors.grey,

        keyboardType: textInputType,
        decoration: InputDecoration(
errorBorder: buildBorder(Colors.red),
          errorStyle: TextStyle(color: Colors.red),
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
