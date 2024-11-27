import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapEx1 extends StatefulWidget {
  const GoogleMapEx1({super.key});

  @override
  State<GoogleMapEx1> createState() => _GoogleMapEx1State();
}

class _GoogleMapEx1State extends State<GoogleMapEx1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
        centerTitle: true,
      ),
      body: const GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // San Francisco
          zoom: 15,
        ),
      ),
    );
  }
}
