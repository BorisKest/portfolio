import 'dart:io';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:portfolio/src/model/note.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
  late Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, "app.db");
    ByteData data = await rootBundle.load("assets/app.db");
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);
    return openDatabase(
      dbPath,
      version: 1,
      onOpen: (db) async {},
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE note(id INTEGER PRIMARY KEY, contents TEXT)');
      },
    );
  }

  newNote(Note note) async {
    final db = await database;
    var res = await db.insert('note', note.toJson());

    return res;
  }

  getNotes(int id) async {
    final db = await database;
    var res = await db.query('note', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? Note.fromJson(res.first) : null;
  }

  updateNote(Note note) async {
    final db = await database;
    var res = await db.update('note', note.toJson());

    return res;
  }

  deleteNote(int id) async {
    final db = await database;

    db.delete('note', where: 'id = ?', whereArgs: [id]);
  }
}
