import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/note_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          if (state is NoteLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is NoteLoaded) {
            print(state.notes);
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.notes.length,
              itemBuilder: ((context, index) {
                return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: const EdgeInsets.all(10),
                    color: Colors.amber,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.notes[index].title,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          state.notes[index].content,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ));
              }),
            );
          }
          if (state is NoteFailure) {
            print("failure");
            return Center(child: Text(state.message));
          }
          return Container();
        },
      )),
    );
  }
}
