import 'package:flutter/material.dart';
import 'package:nota/view/widgets/CustomAppbar.dart';

import '../widgets/customTextField.dart';

class NoteEdit extends StatelessWidget {
  static String routeName='edite note';
  const NoteEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 60,),
           CustomAppbar(title: 'Edit note', iconData: Icons.check,),
            SizedBox(height: 20,),
            CustomTextField(hintText: 'title', labelText: 'title', textInputType: TextInputType.text,),
            CustomTextField(hintText: 'description', labelText: 'description', textInputType: TextInputType.multiline,maxline: 5,)

          ],
        ),
      )
    );
  }
}
