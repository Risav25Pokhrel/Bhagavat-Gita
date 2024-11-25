
import '../../entities/chapters/chapter.dart';

abstract class ChapterRepository{
   Future<List<Chapter>> getChapters();
}