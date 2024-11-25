import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../abstractservices/storage_services.dart';
import '../core/services/api_services/api_service.dart';
import '../core/services/audio_services/text_to_speech.dart';
import '../core/services/get.dart';
import 'data/datasource/chapters/chapter_remote_data_source.dart';
import 'data/datasource/verse/verse_remote_data_source.dart';
import 'data/repositories/chapters/chapter_repo_impl.dart';
import 'data/repositories/verse/verse_repo_impl.dart';
import 'domain/repositories/chapters/chapter_repositories.dart';
import 'domain/repositories/verse/verse_repositories.dart';

//service dependencies
final storageServiceProvider = Provider<StorageServices>((ref) {
  final box = Get.box;
  ref.onDispose(() => box.close);
  return box;
});

final apiServiceProvider = Provider((ref) => ApiManager(ref));

final speechManagerProvider = Provider.autoDispose.family((ref, String arg) {
  final speechManager = SpeechManager(ref.watch(languageAccentProvider));
  ref.onDispose(() => speechManager.stop());
  return speechManager;
});

final languageAccentProvider = StateProvider((ref) => "ne-NP");

// chapter Dependencies
final chapterRemoteDataSourceProvider = Provider<ChapterRemoteDataSource>(
    (ref) => ChapterRemoteDataSourceImpl(ref.read(apiServiceProvider)));

final chapterRepositoryProvider = Provider<ChapterRepository>(
    (ref) => ChapterRepoImpl(ref.read(chapterRemoteDataSourceProvider)));

// final chapterListProvider =
//     StateNotifierProvider<ChapterListProvider, PagedState<int, Chapter>>(
//         (ref) => ChapterListProvider(ref.read(chapterRepositoryProvider)));

// Verse Dependencies
final verseRemoteDataSourceProvider = Provider<VerseRemoteDataSource>(
    (ref) => VerseRemoteDataSourceImpl(ref.read(apiServiceProvider)));

final verseRepositoriesProvider = Provider<VerseRepositories>(
    (ref) => VerseRepoImpl(ref.read(verseRemoteDataSourceProvider)));
