import 'package:flutter/cupertino.dart';

import '../../../../../core/services/get.dart';

class AppSwitch extends StatelessWidget {
  const AppSwitch({super.key, required this.value, required this.onChanged});

  final bool value;
  final dynamic Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: 0.7,
        child: CupertinoSwitch(
            thumbColor: Get.scaffoldBackgroundColor,
            activeColor: Get.primaryColor,
            value: value,
            onChanged: onChanged));
  }
}
