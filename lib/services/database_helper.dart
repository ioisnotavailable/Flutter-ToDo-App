import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/todo_model.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = 'Todo.db';

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            "CREATE TABLE Todo(id INTEGER PRIMARY KEY, metin INTEGER NOT NULL, yapildiMi INTEGER NOT NULL DEFAULT 0);"),
        version: _version);
  }

  static Future<int> addTodo(Todo todo) async {
    final db = await _getDB();
    return await db.insert('Todo', todo.toJason(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateTodo(Todo todo) async {
    final db = await _getDB();
    return await db.update("Todo", todo.toJason(),
        where: 'id = ?',
        whereArgs: [todo.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteTodo(Todo todo) async {
    final db = await _getDB();
    return await db.delete(
      "Todo",
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  static Future<List<Todo>?> getAllTodos() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = (await db.query("Todo"));

    List<Map<String, dynamic>> haritalar = List.from(maps)
      ..sort((a, b) => a['yapildiMi'].compareTo(b['yapildiMi']));

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(
        haritalar.length, (index) => Todo.fromJason(haritalar[index]));
  }
}
