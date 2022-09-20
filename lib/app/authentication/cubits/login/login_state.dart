part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  submitting,
  success,
  error,
}

class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final CustomError error;
  const LoginState({
    required this.loginStatus,
    required this.error,
  });

  factory LoginState.initial() {
    return const LoginState(
        loginStatus: LoginStatus.initial, error: CustomError());
  }

  LoginState copyWith({
    LoginStatus? loginStatus,
    CustomError? error,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [loginStatus, error];

  @override
  String toString() => 'LoginState(loginStatus: $loginStatus, error: $error)';
}
