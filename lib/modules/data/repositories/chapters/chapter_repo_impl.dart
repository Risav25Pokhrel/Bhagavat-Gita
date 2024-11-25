import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/get.dart';
import '../../../domain/entities/chapters/chapter.dart';
import '../../../domain/repositories/chapters/chapter_repositories.dart';
import '../../datasource/chapters/chapter_remote_data_source.dart';

class ChapterRepoImpl implements ChapterRepository {
  final ChapterRemoteDataSource _chapterRemoteDataSource;

  ChapterRepoImpl(this._chapterRemoteDataSource);

  @override
  Future<List<Chapter>> getChapters() async {
    try {
      return await _chapterRemoteDataSource.getChapters();
    } on DioException catch (e) {
      debugPrint(e.message);
      Get.snackbar("Unexpected Error Occur");
      rethrow; // is reresed where it is being watched
    }
  }
}
