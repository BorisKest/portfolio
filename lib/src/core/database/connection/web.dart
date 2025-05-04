import 'dart:async';

import 'package:portfolio/src/core/database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift/web.dart';

/// Obtains a database connection for running drift on the web.
Future connect({bool isInWebWorker = false}) async {
  return Database(
    WebDatabase.withStorage(
      await DriftWebStorage.indexedDbIfSupported('app.db'),
    ),
  );
}

Future<void> validateDatabaseSchema(GeneratedDatabase database) async {
  // Unfortunately, validating database schemas only works for native platforms
  // right now.
  // As we also have migration tests (see the `Testing migrations` section in
  // the readme of this example), this is not a huge issue.
}
