import '../../../domain/entities/verse/verse.dart';
import 'commentary_model.dart';
import 'translation_model.dart';

class VerseModel extends Verse {
  VerseModel(
      {required super.id,
      required super.verseNumber,
      required super.chapterNumber,
      required super.text,
      required super.translations,
      required super.commentaries});

  factory VerseModel.fromJson(Map<String, dynamic> json) {
    return VerseModel(
        id: json['id'] as int,
        verseNumber: json['verse_number'] as int,
        chapterNumber: json['chapter_number'] as int,
        text: json['text'] as String,
        translations: List<TranslationModel>.from(
            (json['translations'] as List<dynamic>).map<TranslationModel>(
                (x) => TranslationModel.fromJson(x as Map<String, dynamic>))),
        commentaries: List<CommentaryModel>.from(
            (json['commentaries'] as List<dynamic>).map<CommentaryModel>(
                (x) => CommentaryModel.fromJson(x as Map<String, dynamic>))));
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'verse_number': verseNumber,
      'chapter_number': chapterNumber,
      'text': text,
      'translations':
          translations.map((x) => (x as TranslationModel).toJson()).toList(),
      'commentaries':
          commentaries.map((x) => (x as CommentaryModel).toJson()).toList(),
    };
  }
}
