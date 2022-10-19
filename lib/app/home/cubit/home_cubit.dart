import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shoeping/app/authentication/models/user.dart';
import 'package:shoeping/app/home/models/last_seen.dart';
import 'package:shoeping/app/home/models/search_recent.dart';
import 'package:shoeping/app/home/repositories/home_repository.dart';
import 'package:shoeping/app/home/repositories/local_repository.dart';
import 'package:shoeping/shared/models/brand.dart';
import 'package:shoeping/shared/models/custom_error.dart';
import 'package:sqflite/sqflite.dart';

import '../../../config/constant.dart';
import '../../../shared/models/product.dart';
import '../../authentication/models/user_wishlist.dart';
import '../models/promo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  final HomeLocalRepository homeLocalRepository;
  HomeCubit({
    required this.homeRepository,
    required this.homeLocalRepository,
  }) : super(HomeState.initial());

  Future<void> getUser() async {
    emit(state.copyWith(userStatus: UserStatus.loading));
    try {
      final UserModel userModel = await homeRepository.getUser();
      emit(
          state.copyWith(userStatus: UserStatus.success, userModel: userModel));
    } on CustomError catch (e) {
      emit(state.copyWith(
        userStatus: UserStatus.error,
        error: e,
      ));
    }
  }

  Future<void> getProducts() async {
    emit(state.copyWith(productStatus: ProductStatus.loading));
    try {
      final List<Product> products = await homeRepository.getProducts();
      emit(state.copyWith(
          productStatus: ProductStatus.success, products: products));
    } on CustomError catch (e) {
      emit(state.copyWith(
        productStatus: ProductStatus.error,
        error: e,
      ));
    }
  }

  Future<void> getBrands() async {
    emit(state.copyWith(brandStatus: BrandStatus.loading));
    try {
      final List<Brand> brands = await homeRepository.getBrands();
      emit(state.copyWith(brandStatus: BrandStatus.success, brands: brands));
    } on CustomError catch (e) {
      emit(state.copyWith(
        brandStatus: BrandStatus.error,
        error: e,
      ));
    }
  }

  Future<void> getPromos() async {
    emit(state.copyWith(promoStatus: PromoStatus.loading));
    try {
      final List<Promo> promos = await homeRepository.getPromos();
      emit(state.copyWith(promoStatus: PromoStatus.success, promos: promos));
    } on CustomError catch (e) {
      emit(state.copyWith(
        promoStatus: PromoStatus.error,
        error: e,
      ));
    }
  }

  Future<void> removeWishlist(Product product) async {
    emit(state.copyWith(
      wishlistStatus: WishlistStatus.loading,
    ));

    try {
      await homeRepository.removeWishlist(product.id);

      var listWishlist = state.userModel!.wishlists!
          .where((element) => element.product != product)
          .toList();
      emit(state.copyWith(
          wishlistStatus: WishlistStatus.success,
          userModel: state.userModel!.copyWith(wishlists: listWishlist)));
    } catch (e) {
      emit(state.copyWith(
        wishlistStatus: WishlistStatus.error,
        error: CustomError(message: e.toString()),
      ));
    }
  }

  Future<void> addWishlist(Product product) async {
    emit(state.copyWith(
      wishlistStatus: WishlistStatus.loading,
    ));

    try {
      await homeRepository.storeWishlist(product.id);

      var listWishlist = state.userModel!.wishlists!.toList();
      listWishlist.add(
        UserWishlist(
          id: 0,
          product: product,
          userId: state.userModel!.id,
        ),
      );

      emit(state.copyWith(
          wishlistStatus: WishlistStatus.success,
          userModel: state.userModel!.copyWith(wishlists: listWishlist)));
    } catch (e) {
      emit(state.copyWith(
          wishlistStatus: WishlistStatus.error,
          error: CustomError(message: e.toString())));
    }
  }

  Future<void> getSearchRecents() async {
    emit(state.copyWith(searchRecentStatus: SearchRecentStatus.loading));
    try {
      var db = await openDatabase(databaseApplication);

      final List<SearchRecent> searchRecents =
          await homeLocalRepository.getRecents(db);

      emit(state.copyWith(
          searchRecentStatus: SearchRecentStatus.success,
          searchRecents: searchRecents));
    } on CustomError catch (e) {
      emit(state.copyWith(
        searchRecentStatus: SearchRecentStatus.error,
        error: e,
      ));
    }
  }

  Future<void> submitSearch(SearchRecent search) async {
    emit(state.copyWith(
        searchRecentStatus: SearchRecentStatus.loading, isLoadingSearch: true));
    try {
      var db = await openDatabase(databaseApplication);

      if (search.keyword.isNotEmpty) {
        await homeLocalRepository.submitSearch(db, search);
      }

      final List<SearchRecent> searchRecents =
          await homeLocalRepository.getRecents(db);
      emit(state.copyWith(
          searchRecentStatus: SearchRecentStatus.success,
          isLoadingSearch: false,
          searchRecents: searchRecents));
    } on CustomError catch (e) {
      emit(state.copyWith(
          searchRecentStatus: SearchRecentStatus.error,
          error: e,
          isLoadingSearch: false));
    }
  }

  Future<void> deleteSearch(SearchRecent search) async {
    emit(state.copyWith(
        searchRecentStatus: SearchRecentStatus.loading, isLoadingSearch: true));
    try {
      var db = await openDatabase(databaseApplication);

      await homeLocalRepository.deleteSearch(db, search.id);

      final List<SearchRecent> searchRecents =
          await homeLocalRepository.getRecents(db);
      emit(state.copyWith(
          searchRecentStatus: SearchRecentStatus.success,
          isLoadingSearch: false,
          searchRecents: searchRecents));
    } on CustomError catch (e) {
      emit(state.copyWith(
          searchRecentStatus: SearchRecentStatus.error,
          error: e,
          isLoadingSearch: false));
    }
  }

  Future<void> deleteAllSearch() async {
    emit(state.copyWith(
        searchRecentStatus: SearchRecentStatus.loading, isLoadingSearch: true));
    try {
      var db = await openDatabase(databaseApplication);

      await homeLocalRepository.deleteAllSearch(db);

      final List<SearchRecent> searchRecents =
          await homeLocalRepository.getRecents(db);
      emit(state.copyWith(
          searchRecentStatus: SearchRecentStatus.success,
          isLoadingSearch: false,
          searchRecents: searchRecents));
    } on CustomError catch (e) {
      emit(state.copyWith(
          searchRecentStatus: SearchRecentStatus.error,
          error: e,
          isLoadingSearch: false));
    }
  }

  Future<void> getLastSeen() async {
    emit(state.copyWith(searchRecentStatus: SearchRecentStatus.loading));
    try {
      var db = await openDatabase(databaseApplication);

      final List<LastSeen> lastSeens =
          await homeLocalRepository.getLastSeen(db);

      emit(state.copyWith(
          lastSeenStatus: LastSeenStatus.success, lastSeens: lastSeens));
    } on CustomError catch (e) {
      emit(state.copyWith(
        lastSeenStatus: LastSeenStatus.error,
        error: e,
      ));
    }
  }
}
