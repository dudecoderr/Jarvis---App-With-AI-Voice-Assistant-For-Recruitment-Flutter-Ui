import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'jarvis_localdata_store_modal.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentDirectory.path, 'database.db');

    if (kDebugMode) {
      print('path :== $path');
    }
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE jarvisevoices (id INTEGER , Title TEXT, date TEXT ,starttime TEXT , lasttime TEXT ,discription TEXT, PRIMARY KEY(id AUTOINCREMENT))');

    if (kDebugMode) {
      print('table create');
    }
  }

  Future<bool> isJarvis(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db!.query('jarvisevoices', where: 'id = ?', whereArgs: [id]);
    return maps.isNotEmpty ? true : false;
  }

  Future addJarvis(Jarvisevoices jarvises) async {
    var db = await database;
    jarvises.id = await db!.insert('jarvisevoices', jarvises.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('data add successfully...${jarvises.Title}');
    print('data add successfully...${jarvises.date}');
    print('data add successfully...${jarvises.starttime}');
    print('data add successfully...${jarvises.lasttime}');
    print('data add successfully...${jarvises.discription}');
    return jarvises;
  }

  Future<List<Map<String, dynamic>>> getJarvis() async {
    var db = await database;

    List<Map<String, dynamic>> maps = await db!.query('jarvisevoices',
        columns: [
          'id',
          'Title',
          'date',
          'starttime',
          'lasttime',
          'discription'
        ]);
    return maps;
  }

  Future<int> deleteJarvis(int id) async {
    print(" object delete thyo==${id}");
    var db = await database;
    return await db!.delete(
      'jarvisevoices',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
