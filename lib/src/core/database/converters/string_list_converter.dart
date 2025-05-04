// Converter for List<String> fields
import 'package:drift/drift.dart';

class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String? fromDb) {
    if (fromDb == null) {
      return [];
    }
    return fromDb.split(',');
  }

  @override
  String toSql(List<String> value) {
    return value.join(',');
  }
}

class StringListConverterNullable
    extends TypeConverter<List<String>?, String?> {
  const StringListConverterNullable();

  @override
  List<String>? fromSql(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    return fromDb.split(',');
  }

  @override
  String? toSql(List<String>? value) {
    if (value == null) {
      return null;
    }
    return value.join(',');
  }
}
