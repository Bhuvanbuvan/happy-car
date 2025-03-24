import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Container googleMap(
    MapCreatedCallback _onMapCreated, LatLng _center, double _zoomLevel) {
  return Container(
    width: double.infinity,
    height: 430,
    decoration: BoxDecoration(
      color: Colors.black,
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
