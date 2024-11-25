import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../extensions/string_extensions.dart';

class SpeechManager {
  FlutterTts flutterTts = FlutterTts();
  final String accent;

  double pitch = 0.5;
  double speed = 0.6;

  final isPlayingNotifier = ValueNotifier(false);

  SpeechManager(this.accent) {
    initSpeech();
  }

  Future<void> initSpeech() async {
    flutterTts.getDefaultVoice;

    flutterTts.setStartHandler(() {});

    flutterTts.setCompletionHandler(() {
      isPlayingNotifier.value = false;
    });
    await flutterTts.setSharedInstance(true);
    await flutterTts.setPitch(pitch);
    await flutterTts.setSpeechRate(speed);
    await flutterTts.setLanguage(accent);
  }

  Future<void> play(String text, String language) async {
    await flutterTts.speak(text.emoji);
    isPlayingNotifier.value = true;
  }

  Future<void> pause() async {
    await flutterTts.pause();
    isPlayingNotifier.value = false;
  }

  Future<void> stop() async {
    await flutterTts.stop();
    isPlayingNotifier.value = false;
  }
}
