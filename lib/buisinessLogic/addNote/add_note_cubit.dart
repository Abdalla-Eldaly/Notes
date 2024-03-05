import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:nota/model/noteModel.dart';
import 'package:flutter/material.dart';
import '../../constants/strings.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color = Color(0xFFFFDB99);
  addnote(NoteModel noteModel) async {
    noteModel.color = color.value;
    emit(AddNoteLoading());
    try {
      var box = Hive.box<NoteModel>(hiveBoxName);
      await box.add(noteModel);
      emit(AddNoteSuccess());

    } catch (e) {
      emit(AddNoteFailer(e.toString()));
    }
  }
}
