import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googlemap/app_user_pages/client_side.dart';
import 'package:googlemap/app_user_pages/delivery_boy_side.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () => Get.to(() => const ClientSide()),
              child: const Text('Client Side'),
            ),
            FilledButton(
              onPressed: () => Get.to(() => const DeliveryBoySide()),
              child: const Text('Delivery Boy Side'),
            ),
          ],
        ),
      ),
    );
  }
}
