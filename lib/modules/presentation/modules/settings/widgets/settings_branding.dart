import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/configs/app_colors.dart';
import '../../../../../core/extensions/textstyle_extensions.dart';
import '../../../../../core/services/get.dart';
import '../../../widgets/text/app_text.dart';

class SettingsTitleBranding extends StatelessWidget {
  const SettingsTitleBranding({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.lightOrange,
      child: Padding(
          padding: const EdgeInsets.all(8.0).r,
          child: AppText(title,
              style: Get.bodyMedium.px18.w600,
              textColor: AppColors.reddisBrown)),
    );
  }
}
