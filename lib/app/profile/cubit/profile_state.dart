part of 'profile_cubit.dart';

enum ProfileSubmitStatus {
  initial,
  submitting,
  success,
  error,
}

class ProfileState extends Equatable {
  final ProfileSubmitStatus profileSubmitStatus;
  final CustomError error;
  const ProfileState({
    required this.profileSubmitStatus,
    required this.error,
  });

  factory ProfileState.initial() {
    return const ProfileState(
        profileSubmitStatus: ProfileSubmitStatus.initial, error: CustomError());
  }

  ProfileState copyWith({
    ProfileSubmitStatus? profileSubmitStatus,
    CustomError? error,
  }) {
    return ProfileState(
      profileSubmitStatus: profileSubmitStatus ?? this.profileSubmitStatus,
      error: error ?? this.error,
    );
  }

  @override
  String toString() =>
      'ProfileState(profileSubmitStatus: $profileSubmitStatus, error: $error)';

  @override
  List<Object> get props => [profileSubmitStatus, error];
}
