import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'app/constants/constants.dart';
import 'app/routes/app_pages.dart';
import 'app/translations/app_translations.dart';
import 'app/ui/splash/splash_screen.dart';
import 'app/ui/splash/splash_binding.dart';

void main() {
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: SplashBinding(),
        initialRoute: Routes.SPLASH,
        theme: appThemeData,
        defaultTransition: Transition.fade,
        getPages: AppPages.pages,
        home: SplashScreen(),
        locale: Locale('vi', 'VN'),
        translationsKeys: AppTranslation.translations,
        builder: EasyLoading.init(),
      )
  );
}
