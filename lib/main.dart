import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mvvm_getx_pattern/app/main_app.dart';
import 'package:mvvm_getx_pattern/app/services/app_translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  AppTranslations appTranslations = AppTranslations();
  await appTranslations.load();
  runApp(
    MainApp(translations: appTranslations),
  );
}
