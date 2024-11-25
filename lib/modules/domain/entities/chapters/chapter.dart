class Chapter {
  int id;
  String name;
  String nameTransliterated;
  String nameTranslated;
  String nameMeaning;
  String chapterSummary;
  String chapterSummaryHindi;
  int verseCount;
  int chapterNumber;

  Chapter(
      {required this.id,
      required this.name,
      required this.nameTransliterated,
      required this.nameTranslated,
      required this.nameMeaning,
      required this.chapterSummary,
      required this.verseCount,
      required this.chapterSummaryHindi,
      required this.chapterNumber});
}
