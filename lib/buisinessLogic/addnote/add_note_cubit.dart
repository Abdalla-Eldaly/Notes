import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:nota/model/noteModel.dart';

import '../../constants/strings.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  addnote(NoteModel noteModel) async {
    emit(AddNoteLoading());
    try {
      var box = Hive.box<NoteModel>(hiveBoxName);
      emit(AddNoteSuccess());
      await box.add(noteModel);
    } catch (e) {
      emit(AddNoteFailer(e.toString()));
    }
  }
}
