import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shoeping/app/authentication/repositories/auth_repository.dart';
import 'package:shoeping/shared/models/custom_error.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit({
    required this.authRepository,
  }) : super(LoginState.initial());

  Future<void> signIn({required String email, required String password}) async {
    emit(state.copyWith(loginStatus: LoginStatus.submitting));
    try {
      await authRepository.signIn(email: email, password: password);

      emit(state.copyWith(loginStatus: LoginStatus.success));
    } on CustomError catch (e) {
      emit(state.copyWith(loginStatus: LoginStatus.error, error: e));
    }
  }
}
