import '../../../../core/services/api_services/api_service.dart';
import '../../../../core/utils/api_endpoints.dart';
import '../../../domain/entities/verse/verse.dart';
import '../../models/verse/verse_model.dart';

abstract class VerseRemoteDataSource {
  //the api didn't have pagination so I didn't use pagination
  Future<List<Verse>> getVerseList(int chapterId);
  Future<Verse> getVerseOfDay(int chapterId, int verseId);
}

class VerseRemoteDataSourceImpl implements VerseRemoteDataSource {
  VerseRemoteDataSourceImpl(this._apiManager);

  final ApiManager _apiManager;

  @override
  Future<List<Verse>> getVerseList(int chapterId) async {
    List<Verse> verses = [];
    final response = await _apiManager.get(ApiEndpoints.verse(chapterId));
    for (var i in response.data) {
      verses.add(VerseModel.fromJson(i));
    }
    return verses;
  }

  @override
  Future<Verse> getVerseOfDay(int chapterId, int verseId) async {
    final response =
        await _apiManager.get(ApiEndpoints.particularVerse(chapterId, verseId));
    return VerseModel.fromJson(response.data);
  }
}
