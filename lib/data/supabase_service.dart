import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseService {
  Future<List<dynamic>> fetchNotes();
}

class SupabaseServiceImpl extends SupabaseService {
  final SupabaseClient _supabase = Supabase.instance.client;

  @override
  Future<List<dynamic>> fetchNotes() async {
    final response = await _supabase.from('note').select();
    return response;
  }
}
