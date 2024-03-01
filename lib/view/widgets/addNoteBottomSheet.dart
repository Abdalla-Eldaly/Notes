import 'package:flutter/material.dart';

import 'customBotton.dart';
import 'customTextField.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(children: [
          CustomTextField(hintText: 'title', labelText: 'title', textInputType: TextInputType.text,maxline: 1,),
          CustomTextField(hintText: 'description', labelText: 'description', textInputType: TextInputType.multiline, maxline: 5,),
          CustomBotton()
        ],),
      ),
    );
  }
}
