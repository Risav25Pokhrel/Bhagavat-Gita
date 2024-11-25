import '../../entities/verse/verse.dart';

abstract class VerseRepositories {
  Future<List<Verse>> getVerseList(int chapterId);
  Future<Verse> getVerseOfDay(int chapterId, int verseId);
}
