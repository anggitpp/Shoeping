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

class HomeState extends Equatable {
  final UserStatus userStatus;
  final UserModel? userModel;
  final ProductStatus productStatus;
  final List<Product>? products;
  final CustomError error;
  const HomeState({
    required this.userStatus,
    this.userModel,
    required this.productStatus,
    this.products,
    required this.error,
  });

  factory HomeState.initial() {
    return const HomeState(
        userStatus: UserStatus.initial,
        productStatus: ProductStatus.initial,
        error: CustomError());
  }

  HomeState copyWith({
    UserStatus? userStatus,
    UserModel? userModel,
    ProductStatus? productStatus,
    List<Product>? products,
    CustomError? error,
  }) {
    return HomeState(
      userStatus: userStatus ?? this.userStatus,
      userModel: userModel ?? this.userModel,
      productStatus: productStatus ?? this.productStatus,
      products: products ?? this.products,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'HomeState(userStatus: $userStatus, userModel: $userModel, productStatus: $productStatus, products: $products, error: $error)';
  }

  @override
  List<Object> get props {
    return [
      userStatus,
      userModel ?? '',
      productStatus,
      products ?? '',
      error,
    ];
  }
}
