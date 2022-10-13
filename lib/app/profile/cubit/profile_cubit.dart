import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoeping/shared/models/custom_error.dart';

import '../repository/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;
  ProfileCubit({
    required this.profileRepository,
  }) : super(ProfileState.initial());

  File? image;

  Future<void> updateProfile({required String name, File? file}) async {
    try {
      emit(state.copyWith(profileSubmitStatus: ProfileSubmitStatus.submitting));
      await profileRepository.updateProfile(name: name, file: file);
      emit(state.copyWith(profileSubmitStatus: ProfileSubmitStatus.success));
    } on CustomError catch (e) {
      emit(state.copyWith(
          profileSubmitStatus: ProfileSubmitStatus.error, error: e));
    }
  }

  Future<void> getImage() async {
    var pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 25);

    image = File(pickedImage!.path);
    emit(state.copyWith(imagePath: pickedImage.name));
  }
}
