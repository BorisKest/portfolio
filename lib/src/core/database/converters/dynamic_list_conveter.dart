import 'package:drift/drift.dart';

class DynamicListConveter extends TypeConverter<List<dynamic>, String> {
  const DynamicListConveter();

  @override
  List<dynamic> fromSql(String? fromDb) {
    try {
      if (fromDb == null) {
        return [];
      }
      return fromDb.split(',').map((e) => e).toList();
    } catch (e) {
      throw Exception('Error parsing dynamic list from sql: $e');
    }
  }

  @override
  String toSql(List<dynamic> value) {
    try {
      return value.join(',');
    } catch (e) {
      throw Exception('Error parsing dynamic list to sql: $e');
    }
  }
}

class DynamicListConverterNullable
    extends TypeConverter<List<dynamic>?, String?> {
  const DynamicListConverterNullable();

  @override
  List<dynamic>? fromSql(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    return fromDb.split(',').map((e) => e).toList();
  }

  @override
  String? toSql(List<dynamic>? value) {
    if (value == null) {
      return null;
    }
    return value.join(',');
  }
}
