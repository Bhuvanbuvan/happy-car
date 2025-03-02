import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
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

  List<String> locations = [
    'Home',
    'Murugan Koil street, north bharathipuram ,shanmugapuram, pondicherry, 605009.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: 70),
            zoomControlsEnabled: false,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: _zoomLevel,
            ),
          ),
          Positioned(
            bottom: 150,
            right: 10,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
              ),
              child: Column(
                children: [
                  IconButton(
                    onPressed: _zoomIn,
                    icon: Icon(
                      Icons.add,
                      size: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: _zoomOut,
                    icon: Icon(
                      Icons.remove,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 5,
            right: 5,
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                shrinkWrap: true,
                physics:
                    BouncingScrollPhysics(), // or NeverScrollableScrollPhysics() if you want to disable scrolling
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5), // Add spacing
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Center(
                        child: index == 0
                            ? Icon(
                                Icons.mic,
                                color: Color.fromARGB(255, 97, 97, 100),
                              )
                            : Text(
                                locations[--index].length > 20
                                    ? '${locations[index].substring(0, 30)}...'
                                    : locations[index],
                                style: TextStyle(color: Colors.black),
                              ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: Color.fromARGB(255, 97, 97, 100),
                  size: 30,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    //open bottom sheet
                    bottomSheet(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 5,
                    ),
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(62, 199, 199, 204),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          8,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        spacing: 12,
                        children: [
                          Icon(
                            Icons.search,
                            color: Color.fromARGB(112, 3, 3, 3),
                          ),
                          Text(
                            "Where are you going?",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(164, 3, 3, 3),
                                fontWeight: FontWeight.w600),
                          )
                        ],
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

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) => DraggableScrollableSheet(
        expand: true,
        initialChildSize: 0.98, // Adjust this to leave 50px space
        minChildSize: 0.98, // Prevent dragging down
        maxChildSize: 0.98, // Prevent expanding beyond this
        builder: (context, scrollController) {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Row(
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
                            ],
                          ),
                        ),
                        Text(
                          "Set Destination",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Visibility(
                          visible: false,
                          child: CupertinoActivityIndicator(
                            radius: 12.0,
                            color: CupertinoColors.activeBlue,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //customer pickup location and drop location
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    pickLocation(
                        icon: 'assets/icons/location.png',
                        title: 'Pickup Location'),
                    pickLocation(
                        icon: 'assets/icons/poin b.png',
                        title: 'Drop Location'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: Color(0xFF0A84FF),
                              size: 25,
                            ),
                            Text(
                              "Add point",
                              style: TextStyle(
                                color: Color(0xFF0A84FF),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "favorite address".toUpperCase(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Color(0xFF0A84FF),
                              size: 25,
                            ),
                            Text(
                              "Home",
                              style: TextStyle(
                                color: Color(0xFF0A84FF),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              width: double.infinity,
              height: 50,
              color: Colors.white,
              child: Center(
                child: Text(
                  'Choose on the map',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget pickLocation({
    required String title,
    required String icon,
  }) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(11, 0, 0, 0),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Image.asset(
              icon,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  color: const Color.fromARGB(255, 40, 39, 39),
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
