import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happycar/config/input_validation.dart';
import 'package:happycar/controller/autherization_controller.dart';
import 'package:happycar/routes.dart';

import '../widgets/button_widget.dart';
import '../widgets/input_text_field.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AutherizationController controller = Get.put(AutherizationController());

  bool isError = false;

  final _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
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
                      InputTextField(
                        hintText: 'Your email',
                        lable: 'Email',
                        controller: controller.emailController,
                        height: isError,
                        validator: (value) {
                          String? error = validateEmail(value);
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
                        "We will send a OTP to your email inbox containing confirmation code.",
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
                      if (_formKey.currentState!.validate()) {
                        Get.toNamed(AppRoutes.otpVerify);
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(content: Text("Valid Email!")),
                        // );
                      }
                    },
                    child: ButtonWidget(
                      text: 'Sent',
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
