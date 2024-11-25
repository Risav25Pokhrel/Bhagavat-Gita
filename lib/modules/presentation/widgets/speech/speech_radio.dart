import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/get.dart';
import '../../../injection_container.dart';
import '../../modules/settings/widgets/app_radio_choices.dart';

class SpeechRadio extends ConsumerWidget {
  const SpeechRadio({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accent = ref.watch(languageAccentProvider);
    return Column(children: [
      RadioChoice(
          text: "English",
          value: accent == "es-US",
          onChanged: (p0) {
            ref.read(languageAccentProvider.notifier).state = 'es-US';
            Get.snackbar("English Accent Selected", color: Colors.teal);
          }),
      RadioChoice(
          text: "Nepali",
          value: accent == "ne-NP",
          onChanged: (p0) {
            ref.read(languageAccentProvider.notifier).state = 'ne-NP';
            Get.snackbar("Nepali Accent Selected", color: Colors.teal);
          }),
      RadioChoice(
          text: "Hindi",
          value: accent == 'hi-IN',
          onChanged: (p0) {
            ref.read(languageAccentProvider.notifier).state = 'hi-IN';
            Get.snackbar("Hindi Accent Selected", color: Colors.teal);
          }),
    ]);
  }
}
