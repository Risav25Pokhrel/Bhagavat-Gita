import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../domain/entities/chapters/chapter.dart';
import 'chapter_list_tile.dart';

class ChapterListLoading extends StatelessWidget {
  const ChapterListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (context, index) => ChapterListTile(Chapter(
                id: 1,
                name: "namenamename",
                nameTransliterated: 'nameTransliterated',
                nameTranslated: ' nameTranslated',
                nameMeaning: 'nameMeaning',
                chapterSummary:
                    'chapterSummarychapterSummarychapterSummarychapterSummarychapterSummarychapterSummary',
                verseCount: 10,
                chapterSummaryHindi: 'chapterSummaryHindi',
                chapterNumber: 5))));
  }
}
