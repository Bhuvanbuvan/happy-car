import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happycar/controller/autherization_controller.dart';

import '../../../../routes.dart';
import '../widgets/button_widget.dart';
import '../widgets/input_text_field.dart';

class InformationScreen extends StatelessWidget {
  InformationScreen({super.key});
  AutherizationController controller = Get.put(AutherizationController());

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Information",
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
                      hintText: 'Your name',
                      lable: 'Name',
                      controller: controller.nameController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InputTextField(
                      hintText: 'Your email',
                      lable: 'Email',
                      controller: controller.nameController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Please enter information about you",
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
                  // Get.toNamed(AppRoutes.otpVerify);
                },
                child: ButtonWidget(
                  text: 'Start',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
