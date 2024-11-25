import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/configs/app_colors.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/extensions/textstyle_extensions.dart';
import '../../../../../core/services/get.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../widgets/buttons/text_buttons.dart';
import '../../../widgets/error_handler/error_button.dart';
import '../../../widgets/text/app_text.dart';
import '../providers/last_read_verse_notifier.dart';
import '../providers/verse_future_provider.dart';
import '../views/verse_description.dart';
import 'verse_of_day_loading.dart';

class VerseOfDayView extends StatelessWidget {
  const VerseOfDayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Get.scaffoldBackgroundColor,
                      blurStyle: BlurStyle.solid,
                      offset: Offset(0, 5.h))
                ]),
                height: 150.h,
                width: double.infinity,
                child: Image.asset(Assets.images.quotesBackground,
                    fit: BoxFit.fill))),
        Positioned(
          bottom: -30.h,
          right: 15,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(10).r,
              height: 140.h,
              width: Get.width - 30,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Get.scaffoldBackgroundColor, width: 2.sp),
                  borderRadius: BorderRadius.circular(20).r,
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          AppColors.black.o4, BlendMode.darken),
                      image: AssetImage(Assets.images.quotesBackground),
                      fit: BoxFit.fill)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText("\tVERSE OF THE DAY",
                      style: Get.bodyLarge.primary.px16),
                  4.verticalSpace,
                  Consumer(
                    builder: (context, ref, child) {
                      final verseOfDay = ref.watch(verseOfADayProvider);
                      return verseOfDay.when(
                        skipLoadingOnRefresh: false,
                        error: (error, stackTrace) =>
                            ErrorButton(provider: verseOfADayProvider),
                        loading: () => VerseOfDayLoading(),
                        data: (verse) {
                          final text = verse.translations
                              .firstWhere(
                                  (element) => element.language == 'english')
                              .description;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(left: 15).r,
                                  child: Text(text,
                                      maxLines: 4,
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      style: Get.bodyMedium.white.w600)),
                              AppTextButton(
                                  text: "READ MORE",
                                  onPressed: () {
                                    ref
                                        .read(lastReadVerseNotifierProvider)
                                        .updateVerse(verse);
                                    Get.to(VerseDescription(verse: verse));
                                  },
                                  style: Get.bodyMedium.px14.white)
                            ],
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
