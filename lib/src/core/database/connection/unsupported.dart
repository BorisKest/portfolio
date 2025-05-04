import 'dart:async';

import 'package:portfolio/src/core/database/database.dart';
import 'package:drift/drift.dart';

Never _unsupported() {
  throw UnsupportedError(
    'No suitable database implementation was found on this platform.',
  );
}

// Depending on the platform the app is compiled to, the following stubs will
// be replaced with the methods in native.dart or web.dart

FutureOr<Database> connect() {
  _unsupported();
}

Future<void> validateDatabaseSchema(GeneratedDatabase database) async {
  _unsupported();
}
