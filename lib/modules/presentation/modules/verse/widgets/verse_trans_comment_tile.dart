import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/textstyle_extensions.dart';
import '../../../../../core/services/get.dart';
import '../../../../injection_container.dart';
import '../../../widgets/buttons/icon_buttons.dart';
import '../../../widgets/text/app_text.dart';
import '../../settings/providers/audio_feature.dart';

class VerseTransCommentaryTile extends ConsumerWidget {
  const VerseTransCommentaryTile(
      {super.key,
      required this.title,
      required this.description,
      required this.language,
      required this.author});

  final String title;
  final String description;
  final String author;
  final String language;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speechManager = ref.watch(speechManagerProvider(description));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(title,
                style: Get.bodyLarge.w700.titleColor,
                textAlign: TextAlign.center),
            if (ref.watch(enableAudioProvider))
              ValueListenableBuilder(
                  valueListenable: speechManager.isPlayingNotifier,
                  builder: (context, isPlaying, child) => AppIconButton(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Get.disabledColor, onTap: () {
                        if (isPlaying) {
                          speechManager.pause();
                          return;
                        }
                        speechManager.play(description, language);
                      })),
          ],
        ),
        15.verticalSpace,
        Text(description,
            textAlign: TextAlign.center, style: Get.bodySmall.px16.w400),
        10.verticalSpace,
        Align(
            alignment: Alignment.centerLeft,
            child: AppText(author, style: Get.bodyMedium.w500.primary.px14)),
        10.verticalSpace,
        Divider(),
        10.verticalSpace,
      ],
    );
  }
}
