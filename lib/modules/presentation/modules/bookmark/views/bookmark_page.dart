import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/text/app_text.dart';
import '../../verse/widgets/verse_tile.dart';
import '../providers/bookmark_notifier.dart';

class BookmarkPage extends ConsumerWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkNotifier = ref.watch(bookmarkNotifierProvider);
    return PlatformScaffold(
      appBar: PlatformAppBar(title: AppText("Bookmarked Sloks")),
      body: ListView.builder(
          itemCount: bookmarkNotifier.verseList.length,
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10).r,
          itemBuilder: (context, index) {
            return VerseTileView(verse: bookmarkNotifier.verseList[index]);
          }),
    );
  }
}
