import 'package:shoeping/app/home/models/last_seen.dart';
import 'package:shoeping/app/home/models/search_recent.dart';
import 'package:shoeping/shared/models/custom_error.dart';
import 'package:shoeping/shared/models/product.dart';
import 'package:sqflite/sqflite.dart';

class HomeLocalRepository {
  final tableSearch = 'search_recents';

  Future<int> submitSearch(Database db, SearchRecent searchRecent) async {
    try {
      await db.delete(tableSearch,
          where: 'keyword = ?', whereArgs: [searchRecent.keyword]);

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
      await db.query(tableSearch, orderBy: 'id DESC', limit: 5);
    } on DatabaseException catch (e) {
      throw CustomError(
          code: 'Database Exception',
          message: e.toString(),
          plugin: 'sqflite exception');
    }

    var recents = await db.query(tableSearch, orderBy: 'id DESC', limit: 5);

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

  Future<void> deleteAllSearch(Database db) async {
    try {
      await db.delete(tableSearch);
    } on DatabaseException catch (e) {
      throw CustomError(
          code: 'Database Exception',
          message: e.toString(),
          plugin: 'sqflite exception');
    }
  }

  Future<int> storeLastSeen(Database db, LastSeen lastSeen) async {
    try {
      await db.delete('last_seen_products',
          where: 'product_id = ?', whereArgs: [lastSeen.productId]);

      int id = await db.insert('last_seen_products', lastSeen.toJson());

      return id;
    } on DatabaseException catch (e) {
      throw CustomError(
          code: 'Database Exception',
          message: e.toString(),
          plugin: 'sqflite exception');
    }
  }

  Future<List<LastSeen>> getLastSeen(Database db) async {
    try {
      await db.query('last_seen_products', orderBy: 'id DESC', limit: 5);
    } on DatabaseException catch (e) {
      throw CustomError(
          code: 'Database Exception',
          message: e.toString(),
          plugin: 'sqflite exception');
    }

    var lastSeen = await db.query('last_seen_products', orderBy: 'id DESC');

    List<LastSeen> lastSeenList = lastSeen.isNotEmpty
        ? lastSeen.map((e) => LastSeen.fromJson(e)).toList()
        : [];

    return lastSeenList;
  }
}
