import 'package:portfolio/src/core/dependencies/data/dependencies.dart';
import 'package:portfolio/src/core/initialization/init_steps.dart';
import 'package:portfolio/src/core/initialization/model/env_store.dart';
import 'package:portfolio/src/core/initialization/model/init_hook.dart';
import 'package:portfolio/src/core/initialization/model/init_info.dart';
import 'package:portfolio/src/core/initialization/model/init_progress.dart';
import 'package:portfolio/src/core/initialization/model/init_result.dart';

part 'init_factory.dart';

String? error;
int tempStepCount = 0;
mixin InitializationProcessor {
  Future<InitializationResult?> processInitialization({
    required Map<String, StepAction> steps,
    required InitializationFactory factory,
    required InitializationHook hook,
  }) async {
    final stopWatch = Stopwatch()..start();
    var stepCount = 0;
    final env = factory.getEnvironmentStore();
    final progress = InitializationProgress(
      dependencies: $MutableDependencies(),
      environmentStore: env,
    );
    // final trackingManager = factory.createSentryTrackingManager(env);
    // await trackingManager.enableReporting(
    //   shouldSend: !kDebugMode && env.isProduction, // black out found!
    // );
    hook.onInit?.call();
    try {
      await for (final step in Stream.fromIterable(steps.entries)) {
        stepCount++;
        final stopWatch = Stopwatch()..start();
        await step.value(progress);
        hook.onInitializing?.call(
          InitializationStepInfo(
            stepName: step.key,
            step: stepCount,
            stepsCount: steps.length,
            msSpent: (stopWatch..stop()).elapsedMilliseconds,
          ),
        );
      }
    } on Object catch (e) {
      error = e.toString();
      tempStepCount = stepCount;
      hook.onError?.call(stepCount, e);
      rethrow;
    }
    stopWatch.stop();
    final result = InitializationResult(
      dependencies: progress.freeze(),
      stepCount: stepCount,
      msSpent: stopWatch.elapsedMilliseconds,
    );
    hook.onInitialized?.call(result);
    return result;
  }
}
