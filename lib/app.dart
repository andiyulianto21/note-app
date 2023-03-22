import 'package:flutter/material.dart';
import 'package:note_bloc_app/data/supabase_service.dart';
import 'package:note_bloc_app/repositories/note_repository.dart';
import 'package:note_bloc_app/views/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/note_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteBloc(
        NoteRepository(
          SupabaseServiceImpl(),
        ),
      )..add(NoteFetch()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes',
        home: HomePage(),
      ),
    );
  }
}
