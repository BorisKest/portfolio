class InitializationStepInfo {
  const InitializationStepInfo({
    required this.stepName,
    required this.step,
    required this.stepsCount,
    required this.msSpent,
  });

  final String stepName;

  final int step;

  final int stepsCount;

  final int msSpent;
}
