import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  Location _locationController = new Location();
  static const LatLng _pGooglePlex = LatLng(37.4223, -122.0846);
  static const LatLng _pApplePark = LatLng(37.3346, -122.0090);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _pGooglePlex, zoom: 20),
          markers: {
            Marker(
              markerId: MarkerId("_currentLocation"),
               icon: BitmapDescriptor.defaultMarker,
               position: _pGooglePlex),
               Marker(
              markerId: MarkerId("_currentLocation"),
               icon: BitmapDescriptor.defaultMarker,
               position: _pApplePark),
          },
          ),
    );
  }

  Future<void> getLocationUpdates()async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
    _serviceEnabled = await _locationController.requestService();
    }
  }
}