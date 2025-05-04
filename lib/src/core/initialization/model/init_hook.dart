import 'package:portfolio/src/core/initialization/model/init_info.dart';
import 'package:portfolio/src/core/initialization/model/init_result.dart';

/// Hook for initialization process.
abstract interface class InitializationHook {
  InitializationHook({
    this.onInit,
    this.onInitializing,
    this.onInitialized,
    this.onError,
  });

  /// Creates a new instance of [InitializationHook] on setup.
  factory InitializationHook.setUp({
    void Function()? onInit,
    void Function(InitializationStepInfo info)? onInitializing,
    void Function(InitializationResult)? onInitialized,
    void Function(int, Object error)? onError,
  }) = _Hook;

  /// Called when the initialization process is started.
  void Function()? onInit;

  /// Called when the initialization process is in progress.
  void Function(InitializationStepInfo info)? onInitializing;

  /// Called when the initialization process is completed.
  void Function(InitializationResult)? onInitialized;

  /// Called when the initialization process is failed.
  void Function(int, Object error)? onError;
}

final class _Hook extends InitializationHook {
  _Hook({
    super.onInit,
    super.onInitializing,
    super.onInitialized,
    super.onError,
  });
}
