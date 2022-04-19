import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:testdb/data/model/db_model.dart';

class DBHelpers {
  static Database? _database;

  static const databaseName_ = "examples.db";
  static const databaseVersion_ = 1;

  static const table_ = "tb_example";

  static const columnID = 'id';
  static const columnNAME = 'name';

  DBHelpers._privateConstructor();

  static final DBHelpers instance = DBHelpers._privateConstructor();

  _initDatabase() async {
    String path = p.join(await getDatabasesPath(), databaseName_);
    return await openDatabase(
      path,
      version: databaseVersion_,
      onCreate: _onCreate,
    );
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table_ (
            $columnID INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnNAME FLOAT NOT NULL
          )
          ''');
  }

  Future<int> insert(DBModel models) async {
    Database db = await instance.database;
    var res = await db.insert(
      table_,
      models.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return res;
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    var res = await db.query(table_, orderBy: '$columnID DESC');
    return res;
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(
      table_,
      where: '$columnID = ?',
      whereArgs: [id],
    );
  }
}
