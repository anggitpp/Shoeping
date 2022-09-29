import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shoeping/app/authentication/repositories/auth_repository.dart';
import 'package:shoeping/shared/models/custom_error.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final AuthRepository authRepository;
  RegistrationCubit({
    required this.authRepository,
  }) : super(RegistrationState.initial());

  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    emit(state.copyWith(registrationStatus: RegistrationStatus.submitting));

    try {
      await authRepository.signUp(name: name, email: email, password: password);

      emit(state.copyWith(registrationStatus: RegistrationStatus.success));
    } on CustomError catch (e) {
      emit(state.copyWith(
          registrationStatus: RegistrationStatus.error, error: e));
    }
  }
}
