import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/extensions/string_extensions.dart';
import '../../../../core/services/get.dart';

class AppReadmore extends StatelessWidget {
  const AppReadmore(
      {super.key,
      required this.text,
      this.textStyle,
      this.trimLine = 2,
      this.readMoreColor});

  final String text;
  final TextStyle? textStyle;
  final int trimLine;
  final Color? readMoreColor;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ReadMoreText(
      text.emoji,
      textAlign: TextAlign.justify,
      colorClickableText: readMoreColor ?? Get.primaryColor,
      trimMode: TrimMode.Line,
      trimLines: trimLine,
      trimCollapsedText: '\n\n\tSHOW MORE',
      trimExpandedText: '\n\n\tSHOW LESS',
      style: textStyle,
    ));
  }
}
