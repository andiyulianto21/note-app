part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class NoteFetch extends NoteEvent {}

class NoteInsert extends NoteEvent {
  final NoteModel newNote;
  const NoteInsert(this.newNote);
}

class NoteDelete extends NoteEvent {
  final int idNote;
  const NoteDelete(this.idNote);
}

class NoteUpdate extends NoteEvent {
  final NoteModel updateNote;
  const NoteUpdate(this.updateNote);
}
