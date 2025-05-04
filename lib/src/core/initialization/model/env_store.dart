import 'package:portfolio/src/core/initialization/model/evn.dart';

abstract interface class IEnvironmentStore {
  abstract final Environment environment;

  abstract final String sentryDsn;

  bool get isProduction => environment == Environment.prod;
}

/// Store for environment variables
///
class EnvironmentStore extends IEnvironmentStore {
  EnvironmentStore();

  static final _env = Environment.fromString(
    const String.fromEnvironment('env'),
  );

  @override
  Environment get environment => _env;

  @override
  String get sentryDsn => const String.fromEnvironment('sentry_dsn');
}
