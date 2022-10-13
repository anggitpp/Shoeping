part of 'profile_cubit.dart';

enum ProfileSubmitStatus {
  initial,
  submitting,
  success,
  error,
}

class ProfileState extends Equatable {
  final ProfileSubmitStatus profileSubmitStatus;
  final String imagePath;
  final bool isLoadedImage;
  final CustomError error;
  const ProfileState({
    required this.profileSubmitStatus,
    required this.imagePath,
    required this.isLoadedImage,
    required this.error,
  });

  factory ProfileState.initial() {
    return const ProfileState(
        profileSubmitStatus: ProfileSubmitStatus.initial,
        imagePath: '',
        isLoadedImage: false,
        error: CustomError());
  }

  ProfileState copyWith({
    ProfileSubmitStatus? profileSubmitStatus,
    String? imagePath,
    bool? isLoadedImage,
    CustomError? error,
  }) {
    return ProfileState(
      profileSubmitStatus: profileSubmitStatus ?? this.profileSubmitStatus,
      imagePath: imagePath ?? this.imagePath,
      isLoadedImage: isLoadedImage ?? this.isLoadedImage,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'ProfileState(profileSubmitStatus: $profileSubmitStatus, imagePath: $imagePath, isLoadedImage: $isLoadedImage, error: $error)';
  }

  @override
  List<Object> get props =>
      [profileSubmitStatus, imagePath, isLoadedImage, error];
}
