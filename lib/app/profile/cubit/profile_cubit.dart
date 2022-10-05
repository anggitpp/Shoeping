import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoeping/shared/models/custom_error.dart';

import '../repository/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;
  ProfileCubit({
    required this.profileRepository,
  }) : super(ProfileState.initial());

  Future<void> updateProfile({required String name}) async {
    try {
      emit(state.copyWith(profileSubmitStatus: ProfileSubmitStatus.submitting));
      await profileRepository.updateProfile(name: name);
      emit(state.copyWith(profileSubmitStatus: ProfileSubmitStatus.success));
    } on CustomError catch (e) {
      emit(state.copyWith(
          profileSubmitStatus: ProfileSubmitStatus.error, error: e));
    }
  }
}
