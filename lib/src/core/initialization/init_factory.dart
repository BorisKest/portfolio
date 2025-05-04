part of 'init_processor.dart';

abstract class InitializationFactory {
  IEnvironmentStore getEnvironmentStore();
}

mixin InitializationFactoryImpl implements InitializationFactory {
  @override
  IEnvironmentStore getEnvironmentStore() => EnvironmentStore();
}
