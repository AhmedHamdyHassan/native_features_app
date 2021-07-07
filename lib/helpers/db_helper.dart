import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<sql.Database> dataBase() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'places.db'), version: 1,
        onCreate: (sql.Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE user_places (id TEXT PRIMARY KEY, title TEXT, image TEXT)');
    });
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final database = await DBHelper.dataBase();
    await database.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final database = await DBHelper.dataBase();
    return database.query(table);
  }
}
