import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/buisinessLogic/fetchNote/note_cubit.dart';
import 'package:nota/model/noteModel.dart';
import 'package:nota/view/screens/noteEdite.dart';

import 'noteItem.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(

      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NoteCubit>(context).notes ?? [];

        return Expanded(
          child: ListView.builder(

            itemCount: notes.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child:
                     NoteItem(note: notes[index],


                  ));
            },
          ),
        );
      },
    );
  }
}
