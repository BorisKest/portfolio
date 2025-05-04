import 'package:portfolio/src/core/dependencies/data/dependencies.dart';
import 'package:portfolio/src/core/initialization/model/env_store.dart';

final class InitializationProgress {
  const InitializationProgress({
    required this.dependencies,
    required this.environmentStore,
  });

  final $MutableDependencies dependencies;

  final IEnvironmentStore environmentStore;

  Dependencies freeze() => dependencies.freeze();
}
