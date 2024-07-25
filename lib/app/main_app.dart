import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mvvm_getx_pattern/app/commons/theme_manager.dart';
import 'package:mvvm_getx_pattern/app/routes/app_pages.dart';
import 'package:mvvm_getx_pattern/app/services/app_translation.dart';

class MainApp extends StatelessWidget {
  final AppTranslations translations;
  const MainApp({super.key, required this.translations});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: translations,
      translationsKeys: translations.keys,
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      theme: ThemeManager().themeData,
      initialRoute:
          GetStorage().read('token') != null ? Routes.CORE : Routes.AUTH,
    );
  }
}
