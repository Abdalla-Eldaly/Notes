import 'package:flutter/material.dart';

import 'customBotton.dart';
import 'customTextField.dart';
import 'nodeForm.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(16),
        child: const NoteForm(),
      ),
    );
  }
}
