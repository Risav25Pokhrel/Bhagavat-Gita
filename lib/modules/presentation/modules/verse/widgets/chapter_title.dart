import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/configs/app_colors.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../widgets/text/app_text.dart';

class ChapterTitle extends StatelessWidget {
  const ChapterTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(Assets.images.chapterFlower,
          width: 20.sp, height: 20.sp, fit: BoxFit.fill),
      20.horizontalSpace,
      AppText(title, textColor: AppColors.blue, fontSize: 20),
      20.horizontalSpace,
      Image.asset(Assets.images.chapterFlower,
          width: 20.sp, height: 20.sp, fit: BoxFit.fill),
    ]);
  }
}
