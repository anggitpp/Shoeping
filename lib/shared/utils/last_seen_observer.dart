import 'package:flutter/material.dart';
import 'package:shoeping/app/home/models/last_seen.dart';

import 'package:shoeping/app/home/repositories/local_repository.dart';
import 'package:shoeping/shared/models/product.dart';
import 'package:sqflite/sqflite.dart';

import '../../config/constant.dart';

class LastSeenObserver extends RouteObserver {
  final HomeLocalRepository homeLocalRepository = HomeLocalRepository();

  @override
  Future<void> didPush(Route route, Route? previousRoute) async {
    if (route.settings.name == 'detail-product') {
      var db = await openDatabase(databaseApplication);
      Product product = route.settings.arguments as Product;
      await homeLocalRepository.storeLastSeen(
          db,
          LastSeen(
              id: 0,
              productId: product.id,
              seenDate: DateTime.now().toIso8601String()));
    }
    super.didPush(route, previousRoute);
  }
}
