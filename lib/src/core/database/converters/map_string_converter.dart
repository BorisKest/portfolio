import 'package:drift/drift.dart';

class MapStringConverter extends TypeConverter<Map<String, String>?, String?> {
  const MapStringConverter();
  @override
  Map<String, String>? fromSql(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    if (fromDb.isEmpty) {
      return {};
    }
    return Map.fromEntries(fromDb.split(',').map((e) {
      final split = e.split(':');
      return MapEntry(split[0], split[1]);
    }));
  }

  @override
  String? toSql(Map<String, String>? value) {
    return value?.entries.map((e) => '${e.key}:${e.value}').join(',');
  }
}
