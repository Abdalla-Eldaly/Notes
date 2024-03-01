import 'package:flutter/material.dart';

import 'noteItem.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,

        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: NoteItem());
        },
      ),
    );
  }
}
