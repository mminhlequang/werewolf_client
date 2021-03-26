
import 'package:get/get.dart';
import 'package:werewolf_client/app/ui/navigation/navigation_binding.dart';
import 'package:werewolf_client/app/ui/navigation/navigation_screen.dart';
import 'package:werewolf_client/app/ui/splash/splash_screen.dart';
part './app_routes.dart';


class AppPages {
  static final pages = [
    GetPage(name: Routes.SPLASH, page:()=> SplashScreen(),),
    GetPage(name: Routes.NAVIGATION, page:()=> NavigationScreen(), binding: NavigationBinding()),
  ];
}