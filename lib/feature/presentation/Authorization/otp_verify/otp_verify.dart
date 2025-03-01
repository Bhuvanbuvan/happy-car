import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:happycar/config/input_validation.dart';
import 'package:happycar/controller/autherization_controller.dart';
import 'package:happycar/routes.dart';

import '../widgets/button_widget.dart';
import '../widgets/input_text_field.dart';

class OtpVerify extends StatefulWidget {
  OtpVerify({super.key});

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  AutherizationController controller = Get.put(AutherizationController());
  bool isError = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Row(
            children: [
              Icon(
                Icons.keyboard_double_arrow_left_sharp,
                color: Color(0xFF0A84FF),
                size: 28,
              ),
              Text(
                "Back",
                style: TextStyle(
                  color: Color(0xFF0A84FF),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 15,
            right: 15,
            bottom: 15,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      InputTextField(
                        hintText: 'Enter the code',
                        lable: 'Code',
                        controller: controller.otpController,
                        height: isError,
                        validator: (value) {
                          String? error = validateOtp(value);
                          if (error != null) {
                            setState(() {
                              isError = true;
                            });
                            return error;
                          }
                          setState(() {
                            isError = false;
                          });
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Enter Confirmation code from SMS",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "Get the code again",
                          style: TextStyle(
                            color: Color(0xFF0A84FF),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Get.toNamed(AppRoutes.information);
                        }
                      },
                      child: ButtonWidget(
                        text: 'Login',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
