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

class HomeState extends Equatable {
  final UserStatus userStatus;
  final UserModel? userModel;
  final ProductStatus productStatus;
  final List<Product>? products;
  final BrandStatus brandStatus;
  final List<Brand>? brands;
  final CustomError error;
  const HomeState({
    required this.userStatus,
    this.userModel,
    required this.productStatus,
    this.products,
    required this.brandStatus,
    this.brands,
    required this.error,
  });

  factory HomeState.initial() {
    return const HomeState(
        userStatus: UserStatus.initial,
        productStatus: ProductStatus.initial,
        brandStatus: BrandStatus.initial,
        error: CustomError());
  }

  HomeState copyWith({
    UserStatus? userStatus,
    UserModel? userModel,
    ProductStatus? productStatus,
    List<Product>? products,
    BrandStatus? brandStatus,
    List<Brand>? brands,
    CustomError? error,
  }) {
    return HomeState(
      userStatus: userStatus ?? this.userStatus,
      userModel: userModel ?? this.userModel,
      productStatus: productStatus ?? this.productStatus,
      products: products ?? this.products,
      brandStatus: brandStatus ?? this.brandStatus,
      brands: brands ?? this.brands,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'HomeState(userStatus: $userStatus, userModel: $userModel, productStatus: $productStatus, products: $products, brandStatus: $brandStatus, brands: $brands, error: $error)';
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
      error,
    ];
  }
}
