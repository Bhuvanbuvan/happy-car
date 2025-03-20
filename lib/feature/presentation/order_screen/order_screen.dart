import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:happycar/feature/presentation/order_screen/cart_list.dart';

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
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            googleMap(),
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
                    cartList(),
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
  }

  Container googleMap() {
    return Container(
      width: double.infinity,
      height: 430,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage("assets/images/order_screen.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: GoogleMap(
        padding: EdgeInsets.only(bottom: 70),
        zoomControlsEnabled: false,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: _zoomLevel,
        ),
      ),
    );
  }

  Widget orderLocations() {
    return Column(
      children: [
        LocationWidget(
          checkedBox: 'assets/icons/checkbox.png',
          location: 'Pickup Location,11ith Street,',
          isKm: false,
        ),
        Divider(
          thickness: 1,
          color: Colors.grey.shade300,
        ),
        LocationWidget(
          checkedBox: 'assets/icons/greencheck.png',
          location: 'Pickup Location,11ith Street,',
          isKm: true,
        ),
      ],
    );
  }
}

class bottomBar extends StatelessWidget {
  const bottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 34,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              height: 50,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF0A84FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Order Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class paymentWidget extends StatelessWidget {
  const paymentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        SizedBox(
          height: 5,
        ),
        Text("Payment Method"),
        Row(
          children: [
            Row(
              children: [
                Image.asset("assets/icons/mastercard.png"),
                SizedBox(
                  width: 10,
                ),
                Text(
                  ".... 4383",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 18,
                  ),
                )
              ],
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  "Change",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 19,
                  color: Colors.black87,
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

class cartList extends StatelessWidget {
  const cartList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: CartList.cartList.length,
        scrollDirection: Axis.horizontal,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: Container(
              height: 130,
              width: 110,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(212, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(123, 255, 255, 255),
                      spreadRadius: 1,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      CartList.cartList[index].image,
                      height: 25,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                    Text(
                      CartList.cartList[index].title,
                    ),
                    Text(
                      CartList.cartList[index].carDkk,
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class addPoint extends StatelessWidget {
  const addPoint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 20,
      ),
      child: Row(
        children: [
          Text(
            "+ Add point",
            style: TextStyle(
              fontSize: 19,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.checkedBox,
    required this.location,
    required this.isKm,
  });
  final String checkedBox;
  final String location;
  final bool isKm;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Image.asset(
              checkedBox,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              location,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Spacer(),
        !isKm
            ? Text('')
            : Text(
                '11Km',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ],
    );
  }
}
