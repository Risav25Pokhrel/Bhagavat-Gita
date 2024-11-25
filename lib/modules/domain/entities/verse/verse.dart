import 'package:flutter/foundation.dart';

import 'commentary.dart';
import 'translation.dart';

class Verse {
  final int id;
  final int verseNumber;
  final int chapterNumber;
  final String text;
  final List<Translation> translations;
  final List<Commentary> commentaries;
  Verse({
    required this.id,
    required this.verseNumber,
    required this.chapterNumber,
    required this.text,
    required this.translations,
    required this.commentaries,
  });
  

  @override
  bool operator ==(covariant Verse other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.verseNumber == verseNumber &&
      other.chapterNumber == chapterNumber &&
      other.text == text &&
      listEquals(other.translations, translations) &&
      listEquals(other.commentaries, commentaries);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      verseNumber.hashCode ^
      chapterNumber.hashCode ^
      text.hashCode ^
      translations.hashCode ^
      commentaries.hashCode;
  }
}
