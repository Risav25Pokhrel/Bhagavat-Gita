import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/get.dart';
import '../../../../domain/entities/verse/translation.dart';
import '../widgets/verse_trans_comment_tile.dart';

class TranslationList extends StatelessWidget {
  const TranslationList({super.key, required this.translations});

  final List<Translation> translations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: Get.scrollPhysics,
      itemCount: translations.length,
      padding: EdgeInsets.symmetric(horizontal: 20).r,
      itemBuilder: (context, index) {
        final translation = translations[index];
        return VerseTransCommentaryTile(
          title: 'Translation',
          description: translation.description,
          author: "${translation.authorName}'s translation",
          language: translation.language,
        );
      },
    );
  }
}
