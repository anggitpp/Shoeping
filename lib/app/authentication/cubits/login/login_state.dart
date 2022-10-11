part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  submitting,
  success,
  error,
}

enum LogoutStatus {
  initial,
  submitting,
  success,
  error,
}

class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final LogoutStatus logoutStatus;
  final CustomError error;
  const LoginState({
    required this.loginStatus,
    required this.logoutStatus,
    required this.error,
  });

  factory LoginState.initial() {
    return const LoginState(
        loginStatus: LoginStatus.initial,
        logoutStatus: LogoutStatus.initial,
        error: CustomError());
  }

  LoginState copyWith({
    LoginStatus? loginStatus,
    LogoutStatus? logoutStatus,
    CustomError? error,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      logoutStatus: logoutStatus ?? this.logoutStatus,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [loginStatus, logoutStatus, error];

  @override
  String toString() =>
      'LoginState(loginStatus: $loginStatus, logoutStatus: $logoutStatus, error: $error)';
}
