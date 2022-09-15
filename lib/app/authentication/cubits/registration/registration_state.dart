part of 'registration_cubit.dart';

enum RegistrationStatus {
  initial,
  submitting,
  success,
  error,
}

class RegistrationState extends Equatable {
  final RegistrationStatus registrationStatus;
  final CustomError error;
  const RegistrationState({
    required this.registrationStatus,
    required this.error,
  });

  factory RegistrationState.initial() {
    return const RegistrationState(
        registrationStatus: RegistrationStatus.initial, error: CustomError());
  }

  RegistrationState copyWith({
    RegistrationStatus? registrationStatus,
    CustomError? error,
  }) {
    return RegistrationState(
      registrationStatus: registrationStatus ?? this.registrationStatus,
      error: error ?? this.error,
    );
  }

  @override
  String toString() =>
      'RegistrationState(registrationStatus: $registrationStatus, error: $error)';

  @override
  List<Object> get props => [registrationStatus, error];
}
