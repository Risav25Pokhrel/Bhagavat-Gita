import '../../../domain/entities/verse/commentary.dart';

class CommentaryModel extends Commentary {
  CommentaryModel(
      {required super.language,
      required super.description,
      required super.authorName});

  factory CommentaryModel.fromJson(Map<String, dynamic> json) {
    return CommentaryModel(
        language: json['language'] as String,
        description: json['description'] as String,
        authorName: json['author_name'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'language': language,
      'description': description,
      'author_name': authorName
    };
  }
}
