import 'package:flutter/material.dart';

import 'customTextField.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomTextField(hintText: 'title', labelText: 'title', textInputType: TextInputType.text,maxline: 1,),
      CustomTextField(hintText: 'description', labelText: 'description', textInputType: TextInputType.multiline, maxline: 5,),
    ],);
  }
}
