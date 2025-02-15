import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happycar/controller/autherization_controller.dart';
import 'package:happycar/feature/presentation/Authorization/otp_verify/otp_verify.dart';
import 'package:happycar/feature/presentation/Authorization/widgets/phone_inputfield.dart';
import 'package:happycar/routes.dart';

import '../widgets/button_widget.dart';

class Login extends StatelessWidget {
  AutherizationController controller = Get.put(AutherizationController());
  Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100,
            left: 15,
            right: 15,
            bottom: 15,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    PhoneInputField(
                      controller: controller,
                      callBackFunction: (
                        value1,
                        value2,
                        value3,
                      ) {},
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "We will send a SMS to your phone number containing confirmation code.",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.otpVerify);
                },
                child:ButtonWidget(text: 'Sent',)
              )
            ],
          ),
        ),
      ),
    );
  }
}
