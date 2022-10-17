import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../config/constant.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async =>
      _database ??= await initializeDatabase();

  Future<Database> initializeDatabase() async {
    //Get the directory path for both Android and IOS to store Database
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, databaseApplication);
    //Open/create the database at the given path
    var systemDatabase =
        await openDatabase(path, version: 1, onCreate: _onCreate);
    return systemDatabase;
  }

  Future _onCreate(Database db, int version) async {
    //CREATE CART TABLE
    await db.execute('''CREATE TABLE cart (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          product_id INTEGER,
          qty INTEGER,
          )''');

    //CREATE SEARCH RECENT TABLE
    await db.execute('''CREATE TABLE search_recent (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          keyword TEXT,
          )''');

    //CREATE LAST SEEN PRODUCT TABLE
    await db.execute('''CREATE TABLE last_seen_product (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          product_id INTEGER,
          seen_date datetime,
          )''');
  }
}
