import 'package:shoeping/app/home/models/search_recent.dart';
import 'package:shoeping/shared/models/custom_error.dart';
import 'package:sqflite/sqflite.dart';

class HomeLocalRepository {
  final tableSearch = 'search_recents';

  Future<int> submitSearch(Database db, SearchRecent searchRecent) async {
    try {
      int id = await db.insert(tableSearch, searchRecent.toJson());

      return id;
    } on DatabaseException catch (e) {
      throw CustomError(
          code: 'Database Exception',
          message: e.toString(),
          plugin: 'sqflite exception');
    }
  }

  Future<List<SearchRecent>> getRecents(Database db) async {
    try {
      await db.query(tableSearch, orderBy: 'id DESC');
    } on DatabaseException catch (e) {
      throw CustomError(
          code: 'Database Exception',
          message: e.toString(),
          plugin: 'sqflite exception');
    }

    var recents = await db.query(tableSearch, orderBy: 'id DESC');

    List<SearchRecent> searchList = recents.isNotEmpty
        ? recents.map((e) => SearchRecent.fromJson(e)).toList()
        : [];

    return searchList;
  }

  Future<void> deleteSearch(Database db, int id) async {
    try {
      await db.delete(tableSearch, where: 'id = ?', whereArgs: [id]);
    } on DatabaseException catch (e) {
      throw CustomError(
          code: 'Database Exception',
          message: e.toString(),
          plugin: 'sqflite exception');
    }
  }
}
