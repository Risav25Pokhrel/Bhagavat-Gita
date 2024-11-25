import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/services/get.dart';
import '../../../injection_container.dart';
import '../../modules/settings/providers/audio_feature.dart';
import '../text/app_text.dart';

class SpeechPopUpMenu extends ConsumerWidget {
  const SpeechPopUpMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAudioEnabled = ref.watch(enableAudioProvider);
    return Padding(
      padding: Get.isIOS ? const EdgeInsets.all(10.0).r : EdgeInsets.zero,
      child: PlatformPopupMenu(options: [
        PopupMenuOption(
            label: "English",
            cupertino: (context, platform) =>
                CupertinoPopupMenuOptionData(isDestructiveAction: false),
            onTap: (p0) {
              ref.read(languageAccentProvider.notifier).state = 'es-US';
              Get.snackbar("English Accent Selected", color: Colors.teal);
            }),
        PopupMenuOption(
            label: "Nepali",
            cupertino: (context, platform) =>
                CupertinoPopupMenuOptionData(isDestructiveAction: false),
            onTap: (p0) {
              ref.read(languageAccentProvider.notifier).state = 'ne-NP';
              Get.snackbar("Nepali Accent Selected", color: Colors.teal);
            }),
        PopupMenuOption(
            label: "Hindi",
            cupertino: (context, platform) =>
                CupertinoPopupMenuOptionData(isDestructiveAction: false),
            onTap: (p0) {
              ref.read(languageAccentProvider.notifier).state = 'hi-IN';
              Get.snackbar("Hindi Accent Selected", color: Colors.teal);
            }),
        PopupMenuOption(
            label: isAudioEnabled ? "Disable Audio" : "Enable Audio",
            cupertino: (context, platform) => CupertinoPopupMenuOptionData(
                isDestructiveAction: isAudioEnabled),
            onTap: (p0) {
              if (isAudioEnabled) {
                Get.snackbar("Audio Feature disabled!!!");
                ref.read(enableAudioProvider.notifier).state = false;
                return;
              }
              Get.snackbar("Audio Feature Enabled!!!", color: Colors.teal);
              ref.read(enableAudioProvider.notifier).state = true;
            })
      ], icon: AppText("Aa")),
    );
  }
}
