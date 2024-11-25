import '../../../domain/entities/chapters/chapter.dart';

class ChapterModel extends Chapter {
  ChapterModel(
      {required super.id,
      required super.name,
      required super.nameTransliterated,
      required super.nameTranslated,
      required super.nameMeaning,
      required super.chapterSummary,
      required super.chapterSummaryHindi,
      required super.verseCount,
      required super.chapterNumber});

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
        id:json['id'] as int,
        name:json['name'] as String,
        nameTransliterated:json['name_transliterated'] as String,
        nameTranslated: json['name_translated'] as String,
        nameMeaning: json['name_meaning']as String,
        chapterSummary: json['chapter_summary']as String,
        chapterSummaryHindi: json['chapter_summary_hindi']as String,
        verseCount: json['verses_count'] as int,
        chapterNumber: json['chapter_number'] as int);
  }
}
