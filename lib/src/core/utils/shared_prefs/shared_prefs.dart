import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract base class SharedPreferencesDao {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesDao(this._sharedPreferences);

  SharedPreferencesEntery<bool> boolEntry(String key) =>
      _SharedPreferencesEntery<bool>(
        sharedPreferences: _sharedPreferences,
        key: key,
      );

  SharedPreferencesEntery<int> intEntry(String key) =>
      _SharedPreferencesEntery<int>(
        sharedPreferences: _sharedPreferences,
        key: key,
      );

  SharedPreferencesEntery<double> doubleEntry(String key) =>
      _SharedPreferencesEntery<double>(
        sharedPreferences: _sharedPreferences,
        key: key,
      );

  SharedPreferencesEntery<String> stringEntry(String key) =>
      _SharedPreferencesEntery<String>(
        sharedPreferences: _sharedPreferences,
        key: key,
      );

  SharedPreferencesEntery<List<String>> listStringEntry(String key) =>
      _SharedPreferencesEntery<List<String>>(
        sharedPreferences: _sharedPreferences,
        key: key,
      );

  SharedPreferencesEntery<Map<int, String>> mapStringEntry(String key) =>
      _SharedPreferencesEntery<Map<int, String>>(
        sharedPreferences: _sharedPreferences,
        key: key,
      );

  SharedPreferencesEntery<Map<String, dynamic>> mapObjectEntry(
    String key,
  ) => // TODO Chnage for the object
      _SharedPreferencesEntery<Map<String, dynamic>>(
    sharedPreferences: _sharedPreferences,
    key: key,
  );

  SharedPreferencesEntery<Map<String, dynamic>> mapDynamicEntry(String key) =>
      _SharedPreferencesEntery<Map<String, dynamic>>(
        sharedPreferences: _sharedPreferences,
        key: key,
      );
}

abstract base class SharedPreferencesEntery<T extends Object> {
  String get key;

  const SharedPreferencesEntery();

  /// Fetch value form shared preferences
  T? read();

  /// Set value to shared preferences
  Future<void> set(T value);

  /// Delete value from shared preferences
  Future<void> delete();

  /// Set the value to shared preferences if null remove
  Future<void> setIfNullDelete(T? value) =>
      value == null ? delete() : set(value);
}

final class _SharedPreferencesEntery<T extends Object>
    extends SharedPreferencesEntery<T> {
  final SharedPreferences _sharedPreferences;

  _SharedPreferencesEntery({
    required SharedPreferences sharedPreferences,
    required this.key,
  }) : _sharedPreferences = sharedPreferences;

  @override
  T? read() {
    if (T == List<String>) {
      return _sharedPreferences.getStringList(key) as T?;
    } else if (T == Map<int, String>) {
      final value = _sharedPreferences.getString(key);

      if (value == null) return null;

      return json.decode(value) as T?;
    } else if (T == Map<String, dynamic>) {
      final value = _sharedPreferences.getString(key);

      if (value == null) return null;

      return json.decode(value) as T?;
    }
    final value = _sharedPreferences.get(key);

    if (value == null) return null;

    if (value is T) return value;

    throw Exception(
      'SharedPreferences value of $key type mismatch. '
      'Expected: $T, Actual: ${value.runtimeType}',
    );
  }

  @override
  final String key;

  @override
  Future<void> set(T value) => switch (value) {
    final int value => _sharedPreferences.setInt(key, value),
    final double value => _sharedPreferences.setDouble(key, value),
    final String value => _sharedPreferences.setString(key, value),
    final bool value => _sharedPreferences.setBool(key, value),
    final List<String> value => _sharedPreferences.setStringList(key, value),
    final Map<int, String> value => _sharedPreferences.setString(
      key,
      json.encode(
        value,
        toEncodable: (dynamic object) {
          return '${object.key.toString()}:${object.value}';
        },
      ),
    ),
    final Map<String, dynamic> value => _sharedPreferences.setString(
      key,
      json.encode(
        value,
        toEncodable: (dynamic object) {
          return '${object.key.toString()}:${object.value}';
        },
      ),
    ),
    _ => throw Exception('$T is not valid type for SharedPreferences'),
  };

  @override
  Future<void> delete() => _sharedPreferences.remove(key);
}
