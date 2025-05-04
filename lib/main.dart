import 'package:portfolio/src/core/initialization/model/init_hook.dart';
import 'package:portfolio/src/core/initialization/model/init_info.dart';
import 'package:portfolio/src/core/initialization/model/init_result.dart';
import 'package:portfolio/src/core/utils/mixin/logger.dart';
import 'package:portfolio/src/feature/app/data/app_runner.dart';

void main() {
  // debugRepaintRainbowEnabled = true;

  final hook = InitializationHook.setUp(
    onInitializing: _onInitializaing,
    onInitialized: _onInitialized,
    onError: _onError,
    onInit: _onInit,
  );
  logger.runLogging(() {
    AppRunner().initializeAndRun(hook);
  }, const LogOptions());
}

void _onInitializaing(InitializationStepInfo info) {
  final precentage = ((info.step / info.stepsCount) * 100).toInt();
  logger.info(
    '✅Done ${info.stepName} in ${info.msSpent} ms. ~~ '
    'Progress: $precentage%',
  );
}

void _onInitialized(InitializationResult result) {
  logger.info(
    '[🚀App Initialization🚀]: ✅ Initialization completed successfully'
    'in ${result.msSpent} ms.',
  );
}

void _onError(int step, Object error) {
  logger.error(
    '[🚀App Initialization🚀]: 💢 Initialization failed at step $step with error:'
    '$error',
  );
}

void _onInit() {
  logger.info('[🚀App Initialization🚀]: 🚀 Initializing app...');
}
