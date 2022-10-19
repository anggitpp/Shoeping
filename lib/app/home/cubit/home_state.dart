part of 'home_cubit.dart';

enum UserStatus {
  initial,
  loading,
  success,
  error,
}

enum ProductStatus {
  initial,
  loading,
  success,
  error,
}

enum BrandStatus {
  initial,
  loading,
  success,
  error,
}

enum PromoStatus {
  initial,
  loading,
  success,
  error,
}

enum WishlistStatus {
  initial,
  loading,
  success,
  error,
}

enum SearchRecentStatus {
  initial,
  loading,
  success,
  error,
}

enum LastSeenStatus {
  initial,
  loading,
  success,
  error,
}

class HomeState extends Equatable {
  final UserStatus userStatus;
  final UserModel? userModel;
  final ProductStatus productStatus;
  final List<Product>? products;
  final BrandStatus brandStatus;
  final List<Brand>? brands;
  final PromoStatus promoStatus;
  final List<Promo>? promos;
  final WishlistStatus wishlistStatus;
  final List<SearchRecent> searchRecents;
  final SearchRecentStatus searchRecentStatus;
  final List<LastSeen> lastSeens;
  final LastSeenStatus lastSeenStatus;
  final bool isLoadingSearch;
  final CustomError error;
  const HomeState({
    required this.userStatus,
    this.userModel,
    required this.productStatus,
    this.products,
    required this.brandStatus,
    this.brands,
    required this.promoStatus,
    this.promos,
    required this.wishlistStatus,
    required this.searchRecents,
    required this.searchRecentStatus,
    required this.lastSeens,
    required this.lastSeenStatus,
    required this.isLoadingSearch,
    required this.error,
  });

  factory HomeState.initial() {
    return const HomeState(
        userStatus: UserStatus.initial,
        productStatus: ProductStatus.initial,
        brandStatus: BrandStatus.initial,
        promoStatus: PromoStatus.initial,
        wishlistStatus: WishlistStatus.initial,
        searchRecentStatus: SearchRecentStatus.initial,
        isLoadingSearch: false,
        searchRecents: [],
        lastSeenStatus: LastSeenStatus.initial,
        lastSeens: [],
        error: CustomError());
  }

  HomeState copyWith({
    UserStatus? userStatus,
    UserModel? userModel,
    ProductStatus? productStatus,
    List<Product>? products,
    BrandStatus? brandStatus,
    List<Brand>? brands,
    PromoStatus? promoStatus,
    List<Promo>? promos,
    WishlistStatus? wishlistStatus,
    List<SearchRecent>? searchRecents,
    SearchRecentStatus? searchRecentStatus,
    List<LastSeen>? lastSeens,
    LastSeenStatus? lastSeenStatus,
    bool? isLoadingSearch,
    CustomError? error,
  }) {
    return HomeState(
      userStatus: userStatus ?? this.userStatus,
      userModel: userModel ?? this.userModel,
      productStatus: productStatus ?? this.productStatus,
      products: products ?? this.products,
      brandStatus: brandStatus ?? this.brandStatus,
      brands: brands ?? this.brands,
      promoStatus: promoStatus ?? this.promoStatus,
      promos: promos ?? this.promos,
      wishlistStatus: wishlistStatus ?? this.wishlistStatus,
      searchRecents: searchRecents ?? this.searchRecents,
      searchRecentStatus: searchRecentStatus ?? this.searchRecentStatus,
      lastSeens: lastSeens ?? this.lastSeens,
      lastSeenStatus: lastSeenStatus ?? this.lastSeenStatus,
      isLoadingSearch: isLoadingSearch ?? this.isLoadingSearch,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'HomeState(userStatus: $userStatus, userModel: $userModel, productStatus: $productStatus, products: $products, brandStatus: $brandStatus, brands: $brands, promoStatus: $promoStatus, promos: $promos, wishlistStatus: $wishlistStatus, searchRecents: $searchRecents, searchRecentStatus: $searchRecentStatus, lastSeens: $lastSeens, lastSeenStatus: $lastSeenStatus, isLoadingSearch: $isLoadingSearch, error: $error)';
  }

  @override
  List<Object> get props {
    return [
      userStatus,
      userModel ?? '',
      productStatus,
      products ?? '',
      brandStatus,
      brands ?? '',
      promoStatus,
      promos ?? '',
      wishlistStatus,
      searchRecents,
      searchRecentStatus,
      lastSeens,
      lastSeenStatus,
      isLoadingSearch,
      error,
    ];
  }
}
