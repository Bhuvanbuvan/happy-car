import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  TextEditingController toLocationController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  List<FavoriteAddress> favorite = [
    FavoriteAddress(
      name: 'Home',
      address: 'Jl. Kebon Sirih No. 1',
      icon: 'assets/icons/home.png',
    ),
    FavoriteAddress(
      name: 'Office',
      address: 'Jl. Kebon Sirih No. 2',
      icon: 'assets/icons/work.png',
    ),
  ];
}

class FavoriteAddress {
  final String name;
  final String address;
  final String icon;

  FavoriteAddress({
    required this.name,
    required this.address,
    required this.icon,
  });
}
