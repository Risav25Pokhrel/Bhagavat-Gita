import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/textstyle_extensions.dart';
import '../../../../../core/services/get.dart';
import '../../../widgets/buttons/text_buttons.dart';
import '../../../widgets/text/app_text.dart';
import '../providers/last_read_verse_notifier.dart';
import 'verse_description.dart';

class LastReadVerse extends ConsumerWidget {
  const LastReadVerse({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastReadVerse = ref.watch(lastReadVerseNotifierProvider);
    if (lastReadVerse.verse == null) {
      return SizedBox.shrink();
    }
    final verse = lastReadVerse.verse!;
    final text = verse.translations
        .firstWhere((element) => element.language == 'english')
        .description;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            AppText("Last read", style: Get.bodyLarge.w700.titleColor),
            Spacer(),
            AppText("VERSE ${verse.chapterNumber}.${verse.verseNumber}",
                style: Get.bodyMedium.w400.titleColor)
          ]),
          5.verticalSpace,
          Text(text, maxLines: 4, style: Get.bodyMedium.w400.titleColor),
          5.verticalSpace,
          AppTextButton(
              text: "Continue Reading",
              onPressed: () => Get.to(VerseDescription(verse: verse)),
              style: Get.bodyMedium.primary),
          10.verticalSpace
        ],
      ),
    );
  }
}
