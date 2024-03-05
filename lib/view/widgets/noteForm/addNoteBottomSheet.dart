import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nota/buisinessLogic/addnote/add_note_cubit.dart';
import 'package:nota/buisinessLogic/fetchNote/note_cubit.dart';
import 'noteForm.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        print("Creating AddNoteCubit-------------------");

        return AddNoteCubit();
      },
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailer) {
            print(state.errorMessage);
          }
          if (state is AddNoteSuccess) {
            BlocProvider.of<NoteCubit>(context).featchnote();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
                padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const SingleChildScrollView(child: NoteForm())),
          );
        },
      ),
    );
  }
}
