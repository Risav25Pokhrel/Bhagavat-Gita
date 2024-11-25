import '../../../domain/entities/verse/translation.dart';

class TranslationModel extends Translation {
  TranslationModel(
      {required super.language,
      required super.description,
      required super.authorName});

  factory TranslationModel.fromJson(Map<String, dynamic> json) {
    return TranslationModel(
        language: json['language'] as String,
        description: json['description'] as String,
        authorName: json['author_name'] as String);
  }
  
  Map<String, dynamic> toJson() {
    return {
      'language':language,
      'description':description,
      'author_name':authorName
    };
  }
}
