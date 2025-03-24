import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:happycar/controller/order_controller.dart';
import 'package:happycar/feature/presentation/order_screen/cart_list.dart';
import 'package:happycar/feature/presentation/order_screen/widgets/add_point.dart';
import 'package:happycar/feature/presentation/order_screen/widgets/bottom_bar.dart';
import 'package:happycar/feature/presentation/order_screen/widgets/car_list.dart';
import 'package:happycar/feature/presentation/order_screen/widgets/google_map.dart';
import 'package:happycar/feature/presentation/order_screen/widgets/order_location.dart';
import 'package:happycar/feature/presentation/order_screen/widgets/payment_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final LatLng _center = const LatLng(13.0827, 80.2707); // San Francisco
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  final TextEditingController locationController = TextEditingController();
  late GoogleMapController _mapController;
  double _zoomLevel = 11.0; // Initial Zoom Level
  OrderController controller = Get.put(OrderController());

  void _zoomIn() {
    _zoomLevel++;
    _mapController.animateCamera(CameraUpdate.zoomTo(_zoomLevel));
  }

  void _zoomOut() {
    _zoomLevel--;
    _mapController.animateCamera(CameraUpdate.zoomTo(_zoomLevel));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (controller) {
      return Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              googleMap(_onMapCreated, _center, _zoomLevel),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 370,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      orderLocations(),
                      addPoint(),
                      controller.selectedCar != null
                          ? Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Search Car. Please wait...",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  CarItem(index: controller.selectedCar!)
                                ],
                              ),
                            )
                          : cartList(
                              controller: controller,
                            ),
                      paymentWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: bottomBar(),
      );
    });
  }
}
