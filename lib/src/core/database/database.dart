import 'package:drift/drift.dart';

part 'database.g.dart';

/// The database class.
/// It contains all the methods to read and write data to the database.
/// It uses the [Drift] package.
/// The database is a singleton.
/// The database is created in the [DatabaseRepository] class.

@DriftDatabase(tables: [])
class Database extends _$Database {
  Database(super.oppenConnection);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: ((Migrator m) async {
        await m.createAll();
      }),
      onUpgrade: (Migrator m, int from, int to) async {
        // Migration
      },
    );
  }

  Future<bool> checkIfColumnExists(Database database, String tableName) async {
    final result =
        await database.customSelect('PRAGMA table_info($tableName)').get();
    return result.map((row) => row.toString()).contains(tableName);
  }
}
