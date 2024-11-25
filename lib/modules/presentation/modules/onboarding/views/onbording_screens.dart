import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/configs/app_colors.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/extensions/int_extensions.dart';
import '../../../../../core/services/get.dart';
import '../../../../../core/utils/storage_key_constants.dart';
import '../../../../injection_container.dart';
import '../../../widgets/buttons/app_buttons.dart';
import '../../../widgets/buttons/text_buttons.dart';
import '../../chapters/views/chapter_homepage.dart';
import '../widgets/onbording_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (index) {
          setState(() {
            isLastPage = index == 3;
          });
        },
        controller: controller,
        itemCount: 4,
        itemBuilder: (context, index) => OnbordingView(index),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isLastPage
          ? Padding(
              padding: const EdgeInsets.only(bottom: 50).r,
              child: Consumer(
                  builder: (context, ref, child) => AppButton(
                      height: 40,
                      width: 123,
                      text: "Get Started",
                      radius: 30,
                      onTap: () {
                        final box = ref.read(storageServiceProvider);
                        box.set(StorageKeys.hasOpenedApp, true);
                        Get.offAll(HomePage());
                      })))
          : null,
      bottomSheet: isLastPage
          ? null
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 10).r,
              height: 70.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTextButton(
                      text: "Skip",
                      onPressed: () => controller.animateToPage(3,
                          duration: 1.seconds, curve: Curves.easeInOutSine)),
                  Center(
                      child: SmoothPageIndicator(
                          controller: controller,
                          count: 3,
                          onDotClicked: (index) => controller.animateToPage(
                              index,
                              duration: 200.milliSeconds,
                              curve: Curves.easeInCirc),
                          effect: ExpandingDotsEffect(
                              radius: 10.sp,
                              dotWidth: 10.sp,
                              dotHeight: 10.sp,
                              activeDotColor: AppColors.primary,
                              dotColor: AppColors.primary.o5))),
                  AppTextButton(
                      text: "Next >",
                      onPressed: () => controller.nextPage(
                          duration: 500.milliSeconds, curve: Curves.easeInCirc))
                ],
              ),
            ),
    );
  }
}
