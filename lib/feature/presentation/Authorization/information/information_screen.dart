import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happycar/config/input_validation.dart';
import 'package:happycar/controller/autherization_controller.dart';
import 'package:happycar/routes.dart';
import '../widgets/button_widget.dart';
import '../widgets/input_text_field.dart';
import '../widgets/phone_inputfield.dart';

class InformationScreen extends StatefulWidget {
  InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  AutherizationController controller = Get.put(AutherizationController());
  final formKey = GlobalKey<FormState>();
  bool isError = false;
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
            key: formKey,
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
                        inputType: TextInputType.name,
                        hintText: 'Your name',
                        lable: 'Name',
                        controller: controller.nameController,
                        height: isError,
                        validator: (value) {
                          String? error = validateString(value);
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
                    if (formKey.currentState!.validate()) {
                      Get.toNamed(AppRoutes.home);
                    }
                  },
                  child: ButtonWidget(
                    text: 'Start',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
