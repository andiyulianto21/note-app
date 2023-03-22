import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:note_bloc_app/models/note_model.dart';
import 'package:note_bloc_app/repositories/note_repository.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteRepository _noteRepository;

  NoteBloc(this._noteRepository) : super(NoteInitial()) {
    on<NoteFetch>(_fetch);
  }

  Future<void> _fetch(NoteFetch event, Emitter emit) async {
    try {
      emit(NoteLoading());
      //fetch
      final result = await _noteRepository.fetchNotes();
      result.fold((l) => emit(NoteFailure(l)), (r) => emit(NoteLoaded(r)));
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }
}
