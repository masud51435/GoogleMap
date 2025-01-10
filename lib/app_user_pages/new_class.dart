import 'package:flutter/material.dart';

class NewClass extends StatefulWidget {
  const NewClass({super.key});

  @override
  State<NewClass> createState() => _NewClassState();
}

class _NewClassState extends State<NewClass> {
  int number = 0;
  Future<void> _incrementCounter() async {
    await Future.delayed(const Duration(seconds: 10));
    setState(() {
      number++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Number: $number'),
          ElevatedButton(
            onPressed: _incrementCounter,
            child: const Text('Increment now new now then '),
          ),
        ],
      ),
    );
  }
}
