import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happycar/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A84FF),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset('assets/icons/logo.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Created By",
                  style: TextStyle(
                    color: Color(0xFFEBEBF5),
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Bhuvanesh",
                  style: TextStyle(
                      color: Color(0xFFEBEBF5),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
