import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../injection_container.dart';
import '../../chapters/providers/chapter_future_provider.dart';

final fetchVerseListProvider = FutureProviderFamily((ref, int chapterID) {
  return ref.read(verseRepositoriesProvider).getVerseList(chapterID);
});

final verseOfADayProvider = FutureProvider((ref) async {
  final chapterList = await ref.read(chapterListProvider.future);
  int max = chapterList.length;
  Random random = Random();
  final chapterId = random.nextInt(max);
  final verseId = 1 + random.nextInt(chapterList[chapterId-1].verseCount);
  return ref.read(verseRepositoriesProvider).getVerseOfDay(chapterId, verseId);
});
