import 'package:get/get.dart';
import 'package:werewolf_client/app/ui/navigation/navigation_binding.dart';
import 'package:werewolf_client/app/ui/navigation/navigation_screen.dart';
import 'package:werewolf_client/app/ui/room/room_binding.dart';
import 'package:werewolf_client/app/ui/room/room_screen.dart';
import 'package:werewolf_client/app/ui/sign_in/sign_in_binding.dart';
import 'package:werewolf_client/app/ui/sign_in/sign_in_screen.dart';
import 'package:werewolf_client/app/ui/sign_up/sign_up_binding.dart';
import 'package:werewolf_client/app/ui/sign_up/sign_up_screen.dart';
import 'package:werewolf_client/app/ui/splash/splash_screen.dart';
import 'package:werewolf_client/app/ui/start/start_screen.dart';

part './app_routes.dart';


class AppPages {
  static final pages = [
    GetPage(name: Routes.SPLASH, page:()=> SplashScreen(),),

    GetPage(name: Routes.START, page:()=> StartScreen(),),
    GetPage(name: Routes.SIGN_IN, page:()=> SignInScreen(), binding: SignInBinding()),
    GetPage(name: Routes.SIGN_UP, page:()=> SignUpScreen(), binding: SignUpBinding()),

    GetPage(name: Routes.NAVIGATION, page:()=> NavigationScreen(), binding: NavigationBinding()),
    GetPage(name: Routes.ROOM, page:()=> RoomScreen(), binding: RoomBinding()),
  ];
}