import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/get.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../domain/entities/verse/verse.dart';
import '../../../widgets/buttons/icon_buttons.dart';
import '../providers/bookmark_notifier.dart';

class BookmarkIcon extends ConsumerWidget {
  const BookmarkIcon(this.verse, {super.key});

  final Verse verse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkNotifier = ref.watch(bookmarkNotifierProvider);
    final isBookmarked = bookmarkNotifier.verseList.contains(verse);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: AppIconButton(
        key: Get.key(isBookmarked),
        isBookmarked ? AppIcons.bookmark : AppIcons.bookmarkOutlined,
        color: Get.disabledColor,
        onTap: () => bookmarkNotifier.update(verse, isBookmarked),
      ),
    );
  }
}
