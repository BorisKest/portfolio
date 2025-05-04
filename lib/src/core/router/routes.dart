import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';

enum Routes with OctopusRoute {
  main('main', title: 'Main');

  const Routes(this.name, {this.title});

  @override
  final String name;

  @override
  final String? title;

  @override
  Widget builder(BuildContext contextm, OctopusState state, OctopusNode node) =>
      switch (this) {
        Routes.main => const Placeholder(),
      };
}
