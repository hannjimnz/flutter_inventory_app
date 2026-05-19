import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Future<Database> InitDB() async{
    final path = join(await getDatabasesPath(), 'inventario.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT UNIQUE,
            password TEXT
          )
          ''');

      },
    );
  }

  static Future <int> registerUser(String email, String password) async {
    final db = await InitDB();
    return await db.insert('users', {'email': email, 'password': password});
  }

  static Future <Map<String, dynamic>?> loginUser(String email, String password) async{
    final db = await InitDB();
    final res = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
      
    );
    return res.isNotEmpty ? res.first : null;
  }
}