import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';


class VerseOfDayLoading extends StatelessWidget {
  const VerseOfDayLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        child: Text(
            "qwertyuiopasdfghjklxcvbkjvsadbjhadhavahafhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhdddddddqwertyuiopasdfghjklxcvbkjvsadbjhadhavahafhhhhhhhhhhhhhh",
            maxLines: 4));
  }
}
