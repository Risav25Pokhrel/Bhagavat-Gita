import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../abstractservices/storage_services.dart';
import '../../../../../core/utils/storage_key_constants.dart';
import '../../../../data/models/verse/verse_model.dart';
import '../../../../domain/entities/verse/verse.dart';
import '../../../../injection_container.dart';

class LastReadVerseNotifier extends ChangeNotifier {
  LastReadVerseNotifier(this._storageServices);
  final StorageServices _storageServices;

  Verse? verse;

  Future<LastReadVerseNotifier> init() async {
    final verseJson = await _storageServices.get(StorageKeys.lastReadVerse);
    if (verseJson != null) {
      verse = VerseModel.fromJson(jsonDecode(verseJson));
      notifyListeners();
    }
    return this;
  }

  updateVerse(Verse verse) {
    this.verse = verse;
    final verseJson = (verse as VerseModel).toJson();
    _storageServices.set(StorageKeys.lastReadVerse, jsonEncode(verseJson));
    notifyListeners();
  }
}

final lastReadVerseNotifierProvider = ChangeNotifierProvider(
    (ref) => LastReadVerseNotifier(ref.read(storageServiceProvider)));
