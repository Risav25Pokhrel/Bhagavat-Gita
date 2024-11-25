import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/get.dart';
import '../../../widgets/error_handler/error_button.dart';
import '../providers/verse_future_provider.dart';
import '../widgets/verse_list_loading.dart';
import '../widgets/verse_tile.dart';

class VerseList extends ConsumerWidget {
  const VerseList(this.chapterId, {super.key});
  final int chapterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchVerseList = ref.watch(fetchVerseListProvider(chapterId));
    return fetchVerseList.when(
        skipLoadingOnRefresh: false,
        error: (error, stackTrace) =>
            ErrorButton(provider: fetchVerseListProvider(chapterId)),
        loading: () => VerseListLoading(),
        data: (verseList) {
          return ListView.builder(
              shrinkWrap: true,
              physics: Get.scrollPhysics,
              itemCount: verseList.length,
              itemBuilder: (context, index) =>
                  VerseTileView(verse: verseList[index]));
        });
  }
}