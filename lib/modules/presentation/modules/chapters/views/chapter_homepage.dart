import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/configs/app_colors.dart';
import '../../../../../core/extensions/double_extensions.dart';
import '../../../../../core/extensions/textstyle_extensions.dart';
import '../../../../../core/services/get.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../widgets/buttons/icon_buttons.dart';
import '../../../widgets/text/app_text.dart';
import '../../bookmark/views/bookmark_page.dart';
import '../../settings/views/settings.dart';
import '../../verse/views/last_read_verse.dart';
import '../../verse/widgets/verse_of_day_container.dart';
import '../providers/chapter_future_provider.dart';
import 'chapter_list.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
          backgroundColor: AppColors.appBarColor,
          title: Align(
              alignment: Alignment.centerLeft,
              child: AppText("\tBHAGAVAD GITA",
                  style: Get.bodyMedium.white.w600.px18)),
          trailingActions: [
            AppIconButton(AppIcons.bookmark,
                color: Get.scaffoldBackgroundColor,
                size: 24,
                onTap: () => Get.to(BookmarkPage())),
            10.horizontalSpace,
            AppIconButton(AppIcons.settings,
                color: Get.scaffoldBackgroundColor,
                size: 20,
                onTap: () => Get.to(SettingsPage())),
            10.horizontalSpace
          ]),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          ref.invalidate(chapterListProvider);
          await Future.delayed(.5.seconds);
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            VerseOfDayView(),
            40.verticalSpace,
            LastReadVerse(),
            AppText("\t\tChapters", style: Get.bodyLarge.w700.titleColor),
            ChapterList()
            // RiverPagedBuilder(
            //     provider: chapterListProvider,
            //     limit: 20,
            //     pagedBuilder: (controller, builder) => PagedListView(
            //         shrinkWrap: true,
            //         physics: Get.scrollPhysics,
            //         pagingController: controller,
            //         padding: EdgeInsets.symmetric(horizontal: 10).r,
            //         builderDelegate: builder),
            //     itemBuilder: (context, item, index) => ChapterListTile(item),
            //     firstPageKey: 1)
          ],
        ),
      ),
    );
  }
}
