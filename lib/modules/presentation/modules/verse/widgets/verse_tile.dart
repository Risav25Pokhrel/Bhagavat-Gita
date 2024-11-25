import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/configs/app_colors.dart';
import '../../../../../core/extensions/textstyle_extensions.dart';
import '../../../../../core/services/get.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../domain/entities/verse/verse.dart';
import '../../../widgets/buttons/icon_buttons.dart';
import '../../../widgets/text/app_text.dart';
import '../providers/last_read_verse_notifier.dart';
import '../views/verse_description.dart';

class VerseTileView extends ConsumerWidget {
  const VerseTileView({super.key, required this.verse});

  final Verse verse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = verse.translations
        .firstWhere((element) => element.language == "english")
        .description;
    return GestureDetector(
      onTap: () {
        ref.read(lastReadVerseNotifierProvider).updateVerse(verse);
        Get.to(VerseDescription(verse: verse));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10).r,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.borderColor))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              AppText("Verse ${verse.id}"),
              Spacer(),
              AppIconButton(AppIcons.rightCheveron,
                  size: 28, padding: EdgeInsets.zero, color: Get.disabledColor)
            ]),
            10.verticalSpace,
            Text(text,
                maxLines: 4,
                textAlign: TextAlign.justify,
                style: Get.bodyMedium.px15.w500.disabledO5),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
