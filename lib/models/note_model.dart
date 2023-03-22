import 'package:equatable/equatable.dart';

class NoteModel extends Equatable {
  int id;
  String title;
  String content;
  String createdAt;
  bool isImportant;

  NoteModel({
    required this.id,
    required this.title,
    this.content = "",
    required this.createdAt,
    required this.isImportant,
  });

  factory NoteModel.fromJson(Map<String, dynamic> map) => NoteModel(
        id: map['id'],
        title: map['title'],
        content: map['content'],
        createdAt: map['created_at'],
        isImportant: map['is_important'],
      );

  @override
  List<Object?> get props => [id, title, content, createdAt, isImportant];
}
