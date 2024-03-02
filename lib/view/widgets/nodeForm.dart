import 'package:flutter/material.dart';

import 'customBotton.dart';
import 'customTextField.dart';

class NoteForm extends StatefulWidget {
  const NoteForm({super.key});

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final GlobalKey<FormState> formKey =GlobalKey();
  AutovalidateMode autovalidateMode =AutovalidateMode.disabled;
  String? title, description;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,

      child: Column(children: [
        CustomTextField(onsave: (value) {
          title=value;
        },hintText: 'title', labelText: 'title', textInputType: TextInputType.text,maxline: 1,),
        CustomTextField(onsave: (value) {
           description=value ;

        },hintText: 'description', labelText: 'description', textInputType: TextInputType.multiline, maxline: 5,),
        CustomBotton(onTap: () {
          if(formKey.currentState!.validate()){
            formKey.currentState!.save();
          }else{
            autovalidateMode =AutovalidateMode.always;
          }
        },)
      ],),
    );
  }
}
