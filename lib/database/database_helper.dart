import 'package:tye1/database/entry_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static String _dbName = "Entries3.db";

  static Future<Database> _getDB() async  {
    print("getDB");
    return openDatabase(join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async => 
      await db.execute("Create Table Entries3(id INTEGER PRIMARY KEY AUTOINCREMENT, amount DOUBLE(9,2) NOT NULL, category  TEXT NOT NULL, createdAt DATE DEFAULT NULL)"),
        version: _version
    );
  }

  static Future<int> addEntry(Entry entry) async {
    final db = await _getDB();
    print((await getDatabasesPath()).toString());
     print("dodaje wpis");
    return await db.insert("Entries3", entry.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateEntry(Entry entry) async {
    final db = await _getDB();
    return await db.update("Entries3", entry.toJson(),
    where: 'id = ?',
    whereArgs: [entry.id],
    conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteEntry(Entry entry) async {
    final db = await _getDB();
    return await db.delete("Entries3",
    where: 'id = ?',
    whereArgs: [entry.id],);
  }

  static Future<List<Entry>?> getAllEntries() async {
    final db = await _getDB();
    print("test");
    final List<Map<String, dynamic>> maps = await db.query("Entries3");
    if(maps.isEmpty){
       print("lista pusta");
      return null;
    }
    return List.generate(maps.length, (index) => Entry.fromJson(maps[index]));

  }


}