import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/extensions/textstyle_extensions.dart';
import '../../../../../core/services/get.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../domain/entities/verse/verse.dart';
import '../../../widgets/buttons/icon_buttons.dart';
import '../../../widgets/speech/speech_pop_up_menu.dart';
import '../../../widgets/text/app_text.dart';
import '../../bookmark/widgets/bookmark_icon.dart';
import 'commentary_list.dart';
import 'translation_list.dart';

class VerseDescription extends StatelessWidget {
  const VerseDescription({super.key, required this.verse});

  final Verse verse;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(trailingActions: [
        BookmarkIcon(verse),
        5.horizontalSpace,
        SpeechPopUpMenu(),
        5.horizontalSpace,
        AppIconButton(AppIcons.menu, color: Get.disabledColor),
        if (!Get.isIOS) 25.horizontalSpace
      ]),
      body: ListView(
        shrinkWrap: true,
        physics: Get.scrollPhysics,
        children: [
          5.verticalSpace,
          AppText("${verse.chapterNumber}.${verse.verseNumber}",
              style: Get.bodyLarge, textAlign: TextAlign.center),
          15.verticalSpace,
          Text(verse.text,
              textAlign: TextAlign.center, style: Get.bodyMedium.primary),
          40.verticalSpace,
          TranslationList(translations: verse.translations),
          15.verticalSpace,
          CommentaryList(commentaries: verse.commentaries)
        ],
      ),
    );
  }
}
