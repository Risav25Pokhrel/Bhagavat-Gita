import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/configs/app_theme.dart';
import 'modules/injection_container.dart';
import 'modules/presentation/modules/bookmark/providers/bookmark_notifier.dart';
import 'modules/presentation/modules/settings/providers/platform_provider.dart';
import 'modules/presentation/modules/splash_screen/views/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/services/get.dart';
import 'modules/presentation/modules/verse/providers/last_read_verse_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  final box = await Get.box.init();
  await dotenv.load(fileName: '.env');
  final lastReadVerseNotifier = await LastReadVerseNotifier(box).init();
  final bookMarkNotifier = await BookmarkNotifier(box).init();
  runApp(ProviderScope(overrides: [
    storageServiceProvider.overrideWith((ref) => box),
    lastReadVerseNotifierProvider.overrideWith((ref) => lastReadVerseNotifier),
    bookmarkNotifierProvider.overrideWith((ref) => bookMarkNotifier)
  ], child: Core()));
}

class Core extends StatelessWidget {
  const Core({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        ensureScreenSize: true,
        designSize: Size(360, 640),
        child: ValueListenableBuilder(
          valueListenable: platformProvider,
          builder: (context, platform, child) => PlatformProvider(
            key: Get.key(platform),
            settings: PlatformSettingsData(
                iosUsesMaterialWidgets: true,
                matchMaterialCaseForPlatformText: false,
                legacyIosUsesMaterialWidgets: true,
                iosUseZeroPaddingForAppbarPlatformIcon: true,
                platformStyle: PlatformStyleData(android: platform)),
            builder: (context) => PlatformTheme(
                themeMode: ThemeMode.light,
                materialLightTheme: AppThemes.lightTheme,
                materialDarkTheme: AppThemes.darkTheme,
                cupertinoDarkTheme: AppThemes.iosdarkTheme,
                cupertinoLightTheme: AppThemes.ioslightTheme,
                builder: (context) => PlatformApp(
                    debugShowCheckedModeBanner: false,
                    navigatorKey: navigatorKey,
                    scrollBehavior: Get.scrollBehaviour,
                    localizationsDelegates: const <LocalizationsDelegate<
                        dynamic>>[
                      DefaultMaterialLocalizations.delegate,
                      DefaultCupertinoLocalizations.delegate,
                      DefaultWidgetsLocalizations.delegate
                    ],
                    home: const SplashScreen())),
          ),
        ));
  }
}
