import 'package:get/get.dart';

class OrderController extends GetxController with StateMixin {
  int? selectedCar;

  selectCar(int index) {
    change(null, status: RxStatus.loading());
    selectedCar = index;
    update();
    change(null, status: RxStatus.success());
  }
}
