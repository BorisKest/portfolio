import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MyWidget extends StatelessWidget {
  MyWidget({Key? key}) : super(key: key);

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
