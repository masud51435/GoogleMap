import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlemap/constants.dart';
import 'package:location/location.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPage();
}

class _GoogleMapPage extends State<GoogleMapPage> {
  @override
  void initState() {
    // TODO: implement initState
    getPolyPoints();
    getCurrentLocation();
    super.initState();
  }

  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);

  LocationData? currentLocation;

  void getCurrentLocation() {
    Location location = Location();

    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );
  }

  List<LatLng> polylineCordinate = [];
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      for (PointLatLng point in result.points) {
        polylineCordinate.add(
          LatLng(
            point.latitude,
            point.longitude,
          ),
        );
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentLocation == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              compassEnabled: true,
              mapType: MapType.hybrid,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  currentLocation!.latitude!,
                  currentLocation!.longitude!,
                ),
                zoom: 13,
              ),
              polylines: {
                Polyline(
                  polylineId: const PolylineId('route'),
                  points: polylineCordinate,
                  color: Colors.deepPurple,
                  width: 6,
                ),
              },
              markers: {
                const Marker(
                  markerId: MarkerId('source'),
                  position: sourceLocation,
                ),
                Marker(
                  markerId: const MarkerId('currentLocation'),
                  position: LatLng(
                    currentLocation!.latitude!,
                    currentLocation!.longitude!,
                  ),
                ),
                const Marker(
                  markerId: MarkerId('destination'),
                  position: destination,
                ),
              },
            ),
    );
  }
}
