import 'package:flutter/material.dart';
import 'package:nota/model/noteModel.dart';
import 'package:nota/view/widgets/editNote/editNoteBody.dart';

import '../widgets/common/customTextField.dart';

class NoteEdit extends StatelessWidget {
  final NoteModel note;
  const NoteEdit({super.key,  required this.note});

  @override
  Widget build(BuildContext context) {
    return BodyEditNote(noteModel: note,);
  }
}
