import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/get.dart';
import '../../../widgets/text/app_text.dart';

class RadioChoice extends StatelessWidget {
  const RadioChoice(
      {super.key, required this.text, this.value, this.onChanged});

  final String text;
  final bool? value;
  final void Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        10.horizontalSpace,
        Padding(
          padding: Get.isIOS ? const EdgeInsets.all(10.0).r : EdgeInsets.zero,
          child: PlatformRadio<bool?>(
              activeColor: Get.disabledColor,
              value: value,
              toggleable: true,
              groupValue: true,
              onChanged: onChanged),
        ),
        10.horizontalSpace,
        AppText(text),
      ],
    );
  }
}
