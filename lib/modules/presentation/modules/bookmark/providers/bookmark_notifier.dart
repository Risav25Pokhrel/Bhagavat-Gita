import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../abstractservices/storage_services.dart';
import '../../../../../core/services/get.dart';
import '../../../../../core/utils/storage_key_constants.dart';
import '../../../../data/models/verse/verse_model.dart';
import '../../../../domain/entities/verse/verse.dart';
import '../../../../injection_container.dart';

class BookmarkNotifier extends ChangeNotifier {
  BookmarkNotifier(this._storageServices);
  final StorageServices _storageServices;

  List<Map<String, dynamic>> verseJsonList = [];
  List<Verse> verseList = [];

  Future<BookmarkNotifier> init() async {
    final storedJson = await _storageServices.get(StorageKeys.bookmarkedVerse);
    if (storedJson != null) {
      for (var i in jsonDecode(storedJson)) {
        verseJsonList.add(i);
        verseList.add(VerseModel.fromJson(i));
      }
    }
    return this;
  }

  _add(Verse verse) async {
    verseList.add(verse);
    verseJsonList.add((verse as VerseModel).toJson());
    _storageServices.set(
        StorageKeys.bookmarkedVerse, jsonEncode(verseJsonList));
    Get.snackbar("Bookmarked", color: Colors.teal);
    notifyListeners();
  }

  _remove(Verse verse) async {
    verseList.removeWhere((element) => element.id == verse.id);
    verseJsonList.removeWhere((element) => element['id'] == verse.id);
    _storageServices.set(
        StorageKeys.bookmarkedVerse, jsonEncode(verseJsonList));
    Get.snackbar("Bookmark removed");
    notifyListeners();
  }

  update(Verse verse, bool isBookedMarked) {
    if (!isBookedMarked) {
      _add(verse);
      return;
    }
    _remove(verse);
  }
}

final bookmarkNotifierProvider = ChangeNotifierProvider(
    (ref) => BookmarkNotifier(ref.read(storageServiceProvider)));
