import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlemap/app_user_pages/order_list.dart';
import 'package:googlemap/app_user_pages/order_tracking_page.dart';

class ClientSide extends StatelessWidget {
  const ClientSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Get.to(() => const OrderList()),
          ),
          IconButton(
            icon: const Icon(Icons.map),
            onPressed: () => Get.to(() => const OrderTrackingPage()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Customer Name',
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Customer Phone',
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Customer Address',
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Customer Bill Amount',
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: 450,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const GoogleMap(
                  mapType: MapType.hybrid,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(37.7749, -122.4194), // San Francisco
                    zoom: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
