import '../../../../core/services/api_services/api_service.dart';
import '../../../../core/utils/api_endpoints.dart';
import '../../../domain/entities/chapters/chapter.dart';
import '../../models/chapter/chapter_model.dart';

abstract class ChapterRemoteDataSource {
  Future<List<Chapter>> getChapters();
}

class ChapterRemoteDataSourceImpl implements ChapterRemoteDataSource {
  final ApiManager _apiManager;

  ChapterRemoteDataSourceImpl(this._apiManager);

  @override
  Future<List<Chapter>> getChapters() async {
    List<Chapter> chapters = [];
    final response = await _apiManager.get(ApiEndpoints.chapter);
    // queryParameters: {'page': page.toString(), 'limit': '20'});//Didn't support the pegination thus
    for (var i in response.data) {
      chapters.add(ChapterModel.fromJson(i));
    }
    return chapters;
  }
}
