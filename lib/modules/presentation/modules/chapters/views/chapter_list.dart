import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/get.dart';
import '../../../widgets/error_handler/error_button.dart';
import '../providers/chapter_future_provider.dart';
import '../widgets/chapter_list_loading.dart';
import '../widgets/chapter_list_tile.dart';

class ChapterList extends ConsumerWidget {
  const ChapterList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchChapterList = ref.watch(chapterListProvider);
    return fetchChapterList.when(
      skipLoadingOnRefresh: false,
      error: (error, stackTrace) => ErrorButton(provider: chapterListProvider),
      loading: () => ChapterListLoading(),
      data: (chapterList) {
        return ListView.builder(
            shrinkWrap: true,
            physics: Get.scrollPhysics,
            itemCount: chapterList.length,
            itemBuilder: (context, index) =>
                ChapterListTile(chapterList[index]));
      },
    );
  }
}
