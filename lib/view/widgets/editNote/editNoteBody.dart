import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/buisinessLogic/fetchNote/note_cubit.dart';
import 'package:nota/model/noteModel.dart';

import '../common/customAppbar.dart';
import '../common/customTextField.dart';
import 'editeColorList.dart';

class BodyEditNote extends StatefulWidget {
  const BodyEditNote({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<BodyEditNote> createState() => _BodyEditNoteState();
}

class _BodyEditNoteState extends State<BodyEditNote> {

  String? title;
  String? content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          CustomAppbar(
            onPressed: () {
              widget.noteModel.title = title??widget.noteModel.title;
              widget.noteModel.subTitle = content??widget.noteModel.subTitle;
              widget.noteModel.save();
              BlocProvider.of<NoteCubit>(context).featchnote();
              Navigator.pop(context);
            },
            title: 'Edit note',
            iconData: Icons.check_rounded,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            textEditingController: TextEditingController(text: widget.noteModel.title) ,
            onChanged: (value) {
              title = value;
            },
            hintText: widget.noteModel.title,
            // labelText: 'title',
            textInputType: TextInputType.text,
          ),
          CustomTextField(
            textEditingController: TextEditingController(text: widget.noteModel.subTitle) ,
            onChanged: (value) {
              content = value;
            },
            hintText: widget.noteModel.subTitle,
            // labelText: 'description',

            textInputType: TextInputType.multiline,
            maxline: 5,
          ),
          SizedBox(height: 15,),
          EditeNoteColorList(noteModel: widget.noteModel,)
        ],
      ),
    ));
  }
}
