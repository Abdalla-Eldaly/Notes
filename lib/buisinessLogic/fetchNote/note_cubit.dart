import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../constants/strings.dart';
import '../../model/noteModel.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  List<NoteModel>? notes;
  featchnote() {
    var box = Hive.box<NoteModel>(hiveBoxName);
    notes = box.values.toList();
    emit(NoteSuccess(notes!));
  }
  void setNotes(List<NoteModel> notes) {
    // Implement logic to set notes in the state
    emit(NoteLoaded(notes));
  }
}
