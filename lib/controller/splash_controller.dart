import 'dart:async';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

import '../routes.dart';

class SplashController extends GetxController with StateMixin {
  @override
  void onInit() {
    super.onInit();
    Timer(
      const Duration(seconds: 3),
      () => Get.offAllNamed(
        // AppRoutes.login,
        AppRoutes.home,
      ),
    );
  }
}
