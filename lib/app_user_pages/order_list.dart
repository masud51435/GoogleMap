import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return const ListTile(
            title: Text('Order Id:'),
            subtitle: Text('Customer:'),
          );
        },
      ),
    );
  }
}
