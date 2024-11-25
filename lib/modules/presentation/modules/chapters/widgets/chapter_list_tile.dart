import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/configs/app_colors.dart';
import '../../../../../core/extensions/textstyle_extensions.dart';
import '../../../../../core/services/get.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../domain/entities/chapters/chapter.dart';
import '../../../widgets/buttons/icon_buttons.dart';
import '../../../widgets/text/app_text.dart';
import '../../verse/views/verse_list_page.dart';

class ChapterListTile extends StatelessWidget {
  const ChapterListTile(this.chapter, {super.key});

  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity(horizontal: 3),
      shape: Border(bottom: BorderSide(color: AppColors.borderColor)),
      title: AppText(chapter.nameTranslated,
          style: Get.bodyMedium.titleColor.w500.px17),
      trailing: AppIconButton(AppIcons.rightCheveron,
          size: 28, padding: EdgeInsets.zero),
      leading: Skeleton.shade(
        child: CircleAvatar(
            radius: 18.r,
            backgroundColor: Get.primaryColor,
            child: AppText(chapter.id.toString(),
                textColor: Get.scaffoldBackgroundColor)),
      ),
      subtitle: Row(mainAxisSize: MainAxisSize.min, children: [
        AppIconButton(Icons.menu),
        8.horizontalSpace,
        AppText("${chapter.verseCount} verses",
            textColor: AppColors.titleColor, fontSize: 14)
      ]),
      onTap: () => Get.to(VerseListPage(chapter)),
    );
  }
}
