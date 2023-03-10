import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/routes/get_pages.dart';
import '../../core/routes/routes_manager.dart';
import '../../core/theme/theme_manager.dart';
import '../../localization/app_translations.dart';
import '../../screens/app/unknown_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          textDirection: TextDirection.rtl,
          debugShowCheckedModeBanner: false,
          theme: ThemeManager.light(),
          initialRoute: RoutesManager.launchScreen,
          getPages: getPages,
          unknownRoute: GetPage(
            name: RoutesManager.unknownScreen,
            page: () => const UnknownScreen(),
          ),
          translations: AppTranslations(),
          locale: Locale(Get.deviceLocale?.languageCode ?? 'ar'),
          fallbackLocale: const Locale('ar'),
        );
      },
    );
  }
}
