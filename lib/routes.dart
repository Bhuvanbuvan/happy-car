import 'package:get/get.dart';
import 'package:happycar/feature/presentation/Authorization/information/information_screen.dart';
import 'package:happycar/feature/presentation/Authorization/login/login.dart';
import 'package:happycar/feature/presentation/Authorization/otp_verify/otp_verify.dart';
import 'package:happycar/feature/presentation/onboarding/on_boarding.dart';
import 'package:happycar/feature/presentation/splash/splash.dart';

import 'feature/presentation/home/home_page.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String onBoardingView = '/onBoarding';
  static const String login = '/login';
  static const String otpVerify = '/otp_verify';
  static const String information = '/information';
  static const String home = '/home';

  static List<GetPage> pages = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: onBoardingView, page: () => OnBoarding()),
    GetPage(name: login, page: () => Login()),
    GetPage(name: otpVerify, page: () => OtpVerify()),
    GetPage(name: information, page: () => InformationScreen()),
    GetPage(name: home, page: () => GoogleMapScreen())
  ];
}
