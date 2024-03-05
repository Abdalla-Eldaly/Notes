part of 'note_cubit.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}
class NoteLoaded extends NoteState {
  final List<NoteModel> notes;

  NoteLoaded(this.notes);
}
class NoteSuccess extends NoteState {
  List<NoteModel> notes ;
  NoteSuccess(this.notes);
}



