import 'package:drift/drift.dart';

class MapIntStringConverter
    extends TypeConverter<Map<String, String>?, String?> {
  const MapIntStringConverter();
  @override
  Map<String, String>? fromSql(String? fromDb) {
    if (fromDb == null) {
      return null;
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
