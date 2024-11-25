import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/assets_path.dart';

class OnbordingView extends StatelessWidget {
  const OnbordingView(this.pageNumber, {super.key});
  final int pageNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff15161b),
        child: Column(
          children: [
            100.verticalSpace,
            Image.asset(Assets.images.onbordingImage(pageNumber),
                width: double.infinity,
                filterQuality: FilterQuality.low,
                fit: BoxFit.contain),
          ],
        ));
  }
}
