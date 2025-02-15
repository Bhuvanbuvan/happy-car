class OnBoardingModel {
  String? title;
  String? description;
  String? image;

  OnBoardingModel({this.title, this.description, this.image});
}

List<OnBoardingModel> onBoardingModelList = [
  OnBoardingModel(
    title: "Route building",
    description:
        "Darg the mark to a specigic point in the map or enter tour street to build route.",
    image: "assets/images/onboarding1.png",
  ),
  OnBoardingModel(
    title: "Trip confirmation",
    description:
        "After building route you will be suggested a car, price and arrifal time.",
    image: "assets/images/onboarding2.png",
  ),
  OnBoardingModel(
    title: "Waiting for a taxi",
    description:
        "Wait for a taxi at the point you have marked A car will be there in a few minutes.",
    image: "assets/images/onboarding3.png",
  ),
];
