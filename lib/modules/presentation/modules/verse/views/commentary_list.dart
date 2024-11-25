import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/get.dart';
import '../../../../domain/entities/verse/commentary.dart';
import '../widgets/verse_trans_comment_tile.dart';

class CommentaryList extends StatelessWidget {
  const CommentaryList({super.key, required this.commentaries});

  final List<Commentary> commentaries;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: Get.scrollPhysics,
      itemCount: commentaries.length,
      padding: EdgeInsets.symmetric(horizontal: 20).r,
      itemBuilder: (context, index) {
        final comment = commentaries[index];
        return VerseTransCommentaryTile(
          title: 'Commentary',
          description: comment.description,
          author: comment.authorName,
          language: comment.language,
        );
      },
    );
  }
}
