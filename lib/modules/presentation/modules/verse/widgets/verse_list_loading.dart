import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../domain/entities/verse/translation.dart';
import '../../../../domain/entities/verse/verse.dart';
import 'verse_tile.dart';

class VerseListLoading extends StatelessWidget {
  const VerseListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) => Skeletonizer(
                child: VerseTileView(
                    verse: Verse(
                        id: 1,
                        verseNumber: 1,
                        chapterNumber: 1,
                        text:
                            'textclass VerseListLoading extends StatelessWidgetclass VerseListLoading extends StatelessWidgetclass VerseListLoading extends StatelessWidget',
                        translations: [
                  Translation(
                      language: 'english',
                      description:
                          'textclass VerseListLoading extends StatelessWidgetclass VerseListLoading extends StatelessWidgetclass VerseListLoading extends StatelessWidget',
                      authorName: 'authorName')
                ],
                        commentaries: []))));
  }
}
