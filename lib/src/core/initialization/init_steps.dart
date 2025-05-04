import 'dart:async';

import 'package:portfolio/src/core/initialization/model/init_progress.dart';

typedef StepAction = FutureOr<void> Function(InitializationProgress progress);

mixin InitializationSteps {
  final initializationSteps = <String, StepAction>{"": (progress) {}};
}
