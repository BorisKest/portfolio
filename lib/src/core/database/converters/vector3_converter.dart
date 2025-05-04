import 'package:drift/drift.dart';

class Vector3Converter extends TypeConverter<List<double>, String> {
  const Vector3Converter();

  @override
  List<double> fromSql(String fromDb) {
    final list = fromDb.split(',').map((e) => double.parse(e)).toList();
    return list;
  }

  @override
  String toSql(List<double> value) {
    return value.join(',');
  }
}
