import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/services/get.dart';
import '../../../domain/entities/verse/verse.dart';
import '../../../domain/repositories/verse/verse_repositories.dart';
import '../../datasource/verse/verse_remote_data_source.dart';

class VerseRepoImpl implements VerseRepositories {
  VerseRepoImpl(this._verseRemoteDataSource);
  final VerseRemoteDataSource _verseRemoteDataSource;
  @override
  Future<List<Verse>> getVerseList(int chapterId) async {
    try {
      return await _verseRemoteDataSource.getVerseList(chapterId);
    } on DioException catch (e) {
      debugPrint(e.message);
      Get.snackbar("Unexpected Error Occur");
      rethrow;
    }
  }

  @override
  Future<Verse> getVerseOfDay(int chapterId, int verseId) async {
    try {
      return await _verseRemoteDataSource.getVerseOfDay(chapterId, verseId);
    } on DioException catch (e) {
      debugPrint(e.message);
      Get.snackbar("Unexpected Error Occur");
      rethrow;
    }
  }
}
