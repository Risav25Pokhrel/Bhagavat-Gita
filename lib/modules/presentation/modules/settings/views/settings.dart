import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/services/get.dart';
import '../../../widgets/speech/speech_radio.dart';
import '../providers/audio_feature.dart';
import '../widgets/app_radio_choices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/text/app_text.dart';
import '../widgets/app_switch.dart';
import '../widgets/settings_branding.dart';
import '../providers/platform_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(title: AppText("Settings")),
      body: Column(children: [
        SettingsTitleBranding(title: "Languages"),
        SpeechRadio(),
        SettingsTitleBranding(title: "Audio Feature"),
        Consumer(builder: (context, ref, child) {
          final audioEnabled = ref.watch(enableAudioProvider);
          return Column(children: [
            RadioChoice(
                text: "Off",
                value: !audioEnabled,
                onChanged: (p0) {
                  Get.snackbar("Audio Feature Disabled");
                  ref.read(enableAudioProvider.notifier).state = false;
                }),
            RadioChoice(
                text: "On",
                value: audioEnabled,
                onChanged: (p0) {
                  Get.snackbar("Audio Feature Enabled!!!", color: Colors.teal);
                  ref.read(enableAudioProvider.notifier).state = true;
                })
          ]);
        }),
        Divider(),
        Row(children: [
          15.horizontalSpace,
          AppText("Enable IOS View"),
          Spacer(),
          ValueListenableBuilder(
              valueListenable: platformProvider,
              builder: (context, value, child) => AppSwitch(
                  value: value == PlatformStyle.Cupertino,
                  onChanged: (_) {
                    if (value == PlatformStyle.Cupertino) {
                      platformProvider.value = PlatformStyle.Material;
                      return;
                    }
                    platformProvider.value = PlatformStyle.Cupertino;
                  }))
        ]),
      ]),
    );
  }
}
