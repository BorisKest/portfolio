enum Environment {
  dev('DEV'),
  prod('PROD');

  const Environment(this.value);

  static Environment fromString(String value) => switch (value) {
    'DEV' => dev,
    'PROD' => prod,
    _ => throw ArgumentError.value(value, 'value', 'Invalid environment'),
  };

  final String value;
}
