import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:note_bloc_app/data/supabase_service.dart';
import 'package:note_bloc_app/models/note_model.dart';

class NoteRepository {
  final SupabaseServiceImpl supabaseService;
  NoteRepository(this.supabaseService);

  Future<Either<String, List<NoteModel>>> fetchNotes() async {
    try {
      final response = await supabaseService.fetchNotes();
      if (response.isNotEmpty) {
        var notes = response.map((e) => NoteModel.fromJson(e)).toList();
        return Right(notes);
      }
      return right([]);
    } catch (e) {
      return left(e.toString());
    }
  }
}
