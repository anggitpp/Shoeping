import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shoeping/app/authentication/models/user.dart';
import 'package:shoeping/app/home/repositories/home_repository.dart';
import 'package:shoeping/shared/models/brand.dart';
import 'package:shoeping/shared/models/custom_error.dart';

import '../../../shared/models/product.dart';
import '../../authentication/models/user_wishlist.dart';
import '../models/promo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  HomeCubit({
    required this.homeRepository,
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
      print(listWishlist);
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
}
