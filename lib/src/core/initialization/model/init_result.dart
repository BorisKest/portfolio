import 'package:portfolio/src/core/dependencies/data/dependencies.dart';

final class InitializationResult {
  const InitializationResult({
    required this.dependencies,
    required this.stepCount,
    required this.msSpent,
  });

  final Dependencies dependencies;

  final int stepCount;

  final int msSpent;

  @override
  String toString() =>
      'InitializationResult('
      'dependencies: $dependencies, '
      'stepCount: $stepCount, '
      'msSpent: $msSpent,'
      ')';
}
