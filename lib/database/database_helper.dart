import 'package:flutter/foundation.dart';
import 'package:tye1/database/entry_model.dart';
import 'package:tye1/database/category_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static String _dbName = "Entries17.db";

  static Future<Database> _getDB() async  {
    return openDatabase(join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async => {
        await db.execute("CREATE TABLE Entries17 (id INTEGER PRIMARY KEY AUTOINCREMENT, amount REAL NOT NULL, category TEXT NOT NULL, createdAt TEXT DEFAULT CURRENT_TIMESTAMP);"),
        await db.execute("CREATE TABLE dcategories (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, icondata INT NOT NULL, color INT DEFAULT 0);"),
        await db.rawInsert('insert INTO dcategories("name", "icondata", "color") SELECT "Spożywcze" AS "name", 0xe395 AS "icondata", 0xff9900 as "color" UNION ALL SELECT "Używki", 0xe5c8, 0xff0000 UNION ALL SELECT "Hobby", 0xe46b, 0x00cc00 UNION ALL SELECT "Oszczędności", 0xe553, 0x3366ff')

    },
        version: _version
    );
  }
  //TODO:INIT TABLE CATEGORIES

  static Future<int> addEntry(Entry entry) async {
    final db = await _getDB();
    return await db.insert("Entries17", entry.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateEntry(Entry entry) async {
    final db = await _getDB();
    return await db.update("Entries17", entry.toJson(),
    where: 'id = ?',
    whereArgs: [entry.id],
    conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteEntry(Entry entry) async {
    final db = await _getDB();
    return await db.delete("Entries17",
    where: 'id = ?',
    whereArgs: [entry.id],);
  }

  static Future<List<Entry>?> getAllEntries() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query("Entries17");
    if(maps.isEmpty){
      return null;
    }
    return List.generate(maps.length, (index) => Entry.fromJson(maps[index]));
  }

  static Future<int> addCategory(CategoryModel category) async{
    final db = await _getDB();
    return await db.insert("dcategories", category.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteCategory(CategoryModel category) async {
    final db = await _getDB();
    return await db.delete("dcategories",
      where: 'id = ?',
      whereArgs: [category.id],);
  }

  static Future<List<CategoryModel>?> getAllCategories() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query("dcategories");
    if(maps.isEmpty){
      return null;
    }
    return List.generate(maps.length, (index) => CategoryModel.fromJson(maps[index]));
  }

  static Future<void> initializeCategories() async {
    final db = await _getDB();
    db.rawInsert('insert INTO dcategories("name", "icondata", "color") SELECT "Spożywcze" AS "name", 0xe395 AS "icondata", 0xff9900 as "color" UNION ALL SELECT "Używki", 0xe5c8, 0xff0000 UNION ALL SELECT "Hobby", 0xe46b, 0x00cc00 UNION ALL SELECT "Oszczędności", 0xe553, 0x3366ff');
  }


}