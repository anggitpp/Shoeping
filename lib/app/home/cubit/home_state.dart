part of 'home_cubit.dart';

enum UserStatus {
  initial,
  loading,
  success,
  error,
}

class HomeState extends Equatable {
  final UserStatus userStatus;
  final UserModel? userModel;
  const HomeState({
    required this.userStatus,
    this.userModel,
  });

  factory HomeState.initial() {
    return const HomeState(
      userStatus: UserStatus.initial,
    );
  }

  HomeState copyWith({
    UserStatus? userStatus,
    UserModel? userModel,
  }) {
    return HomeState(
      userStatus: userStatus ?? this.userStatus,
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  String toString() =>
      'HomeState(userStatus: $userStatus, userModel: $userModel)';

  @override
  List<Object> get props => [userStatus, userModel ?? ''];
}
