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
      appBar: AppBar(title: Text('Google Maps')),
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: _zoomLevel,
            ),
          ),
          Positioned(
            bottom: 30,
            right: 10,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: "zoomIn",
                  mini: true,
                  onPressed: _zoomIn,
                  child: Icon(Icons.add),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: "zoomOut",
                  mini: true,
                  onPressed: _zoomOut,
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
