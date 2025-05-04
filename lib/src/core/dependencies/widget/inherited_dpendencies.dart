import 'package:portfolio/src/core/dependencies/data/dependencies.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InheritedDpendencies extends InheritedWidget {
  const InheritedDpendencies({
    super.key,
    required this.dependencies,
    required super.child,
  });

  final Dependencies dependencies;

  static Dependencies? maybeOf(BuildContext context) {
    return (context
                .getElementForInheritedWidgetOfExactType<InheritedDpendencies>()
                ?.widget
            as InheritedDpendencies?)
        ?.dependencies;
  }

  static Never _notFoundInheritedWidgetOfExactType() {
    throw ArgumentError(
      'Out of scope.'
      'Not found InheritedWidget of type InheritedDpendencies.',
    );
  }

  static Dependencies of(BuildContext context) {
    return maybeOf(context) ?? _notFoundInheritedWidgetOfExactType();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<Dependencies>('dependencies', dependencies),
    );
  }

  @override
  bool updateShouldNotify(InheritedDpendencies oldWidget) {
    return dependencies != oldWidget.dependencies;
  }
}
