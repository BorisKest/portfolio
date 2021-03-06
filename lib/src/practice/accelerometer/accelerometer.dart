import 'package:flutter/material.dart';

class AccelerometerScreen extends StatelessWidget {
  AccelerometerScreen({Key? key}) : super(key: key);

  var speed = 0;
  List<double>? _accelerometerValues;

  @override
  Widget build(BuildContext context) {
    final accelerometer =
        _accelerometerValues?.map((double v) => v.toStringAsFixed(1)).toList();
    return Scaffold(
      appBar: AppBar(),
      body: Text('Accelerometer: $accelerometer'),
    );
  }
}
