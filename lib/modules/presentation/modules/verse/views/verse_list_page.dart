import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/configs/app_text_style.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/extensions/textstyle_extensions.dart';
import '../../../../../core/services/get.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../domain/entities/chapters/chapter.dart';
import '../../../widgets/text/app_text.dart';
import '../../../widgets/text/readmore.dart';
import '../widgets/chapter_title.dart';
import 'verse_list.dart';

class VerseListPage extends StatelessWidget {
  const VerseListPage(this.chapter, {super.key});

  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        appBar: PlatformAppBar(),
        body: Stack(fit: StackFit.expand, children: [
          Positioned(
              child: Image.asset(Assets.images.krishnaBackground,
                  fit: BoxFit.fill)),
          ListView(
              shrinkWrap: true,
              physics: Get.scrollPhysics,
              padding: EdgeInsets.symmetric(horizontal: 30).r,
              children: [
                5.verticalSpace,
                ChapterTitle(title: "Chapter ${chapter.id}"),
                10.verticalSpace,
                AppText(chapter.nameTranslated,
                    style: Get.bodyMedium.px15o5.w600,
                    textAlign: TextAlign.center),
                20.verticalSpace,
                AppReadmore(
                    text: chapter.chapterSummary,
                    trimLine: 4,
                    readMoreColor: Get.disabledColor.o8,
                    textStyle: AppTextStyles.bodyMedium.px14.w500.disabledO5),
                30.verticalSpace,
                VerseList(chapter.id)
              ])
        ]));
  }
}
