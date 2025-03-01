import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happycar/controller/on_boarding_conroller.dart';
import 'package:happycar/feature/presentation/onboarding/model/on_boarding_model.dart';

import '../../../routes.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});
  OnBoardingConroller onBoardingController = Get.put(OnBoardingConroller());

  PageController pageController = Get.put(PageController(initialPage: 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: onBoardingController.pageViewIndex.value != 2,
                      child: GestureDetector(
                        onTap: () {
                          if (onBoardingController.pageViewIndex.value == 0 ||
                              onBoardingController.pageViewIndex.value == 1) {
                            pageController
                                .jumpToPage(onBoardingModelList.length - 1);
                            Get.toNamed(AppRoutes.login);
                          }
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  itemCount: 3,
                  controller: pageController,
                  onPageChanged: (value) {
                    onBoardingController.pageViewIndex.value = value;
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Image.asset(
                            onBoardingModelList[index].image!,
                            width: 350,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  },
                ),
              ),
              Obx(
                () => DotsIndicator(
                  dotsCount: 3,
                  position: onBoardingController.pageViewIndex.value,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                () => Text(
                  onBoardingModelList[onBoardingController.pageViewIndex.value]
                      .title!,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                () => Text(
                  textAlign: TextAlign.center,
                  onBoardingModelList[onBoardingController.pageViewIndex.value]
                      .description!,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    if (onBoardingController.pageViewIndex.value <
                        onBoardingModelList.length - 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    } else {
                      Get.toNamed(AppRoutes.login);
                    }
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: onBoardingController.pageViewIndex.value != 2
                          ? Color(0xFFEFEFF4)
                          : Colors.blue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        onBoardingController.pageViewIndex.value <
                                onBoardingModelList.length - 1
                            ? "Next"
                            : "Continue",
                        style: TextStyle(
                          color: onBoardingController.pageViewIndex.value != 2
                              ? Colors.blue
                              : Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
