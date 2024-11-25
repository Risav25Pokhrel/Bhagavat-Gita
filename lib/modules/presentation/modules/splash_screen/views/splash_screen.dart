import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/extensions/int_extensions.dart';
import '../../../../../core/services/get.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/storage_key_constants.dart';
import '../../../../injection_container.dart';
import '../../chapters/views/chapter_homepage.dart';
import '../../onboarding/views/onbording_screens.dart';
import 'package:flutter/material.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkAndRedirect();
  }

  checkAndRedirect() async {
    final box = ref.read(storageServiceProvider);
    final hasOpenedApp = await box.get(StorageKeys.hasOpenedApp) ?? false;
    Future.delayed(2.seconds).then(
        (_) => Get.offAll(hasOpenedApp ? HomePage() : OnboardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(Assets.images.splashImage, fit: BoxFit.fill),
      ),
    );
  }
}
