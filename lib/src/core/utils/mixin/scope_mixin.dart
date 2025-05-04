import 'package:flutter/material.dart';

abstract class ChildController {
  Widget? get child;
}

mixin ScopeMixin<T extends Widget> on Widget implements ChildController {
  static T? scopeMaybeOf<T extends InheritedWidget>(
    BuildContext context, {
    bool listen = true,
  }) {
    T? inheritedWidget;
    if (listen) {
      inheritedWidget = context.dependOnInheritedWidgetOfExactType<T>();
    } else {
      inheritedWidget =
          context.getElementForInheritedWidgetOfExactType<T>()?.widget as T?;
    }
    return inheritedWidget;
  }

  static T scopeOf<T extends InheritedWidget>(
    BuildContext context, {
    bool listen = true,
  }) =>
      scopeMaybeOf<T>(context, listen: listen) ??
      notFoundInheritedWidgetOfExactType<T>();

  static Never notFoundInheritedWidgetOfExactType<
    T extends InheritedWidget
  >() => throw ArgumentError('Out of scope: $T of the exact type');
}
