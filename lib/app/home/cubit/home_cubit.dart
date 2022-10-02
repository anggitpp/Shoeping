import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:shoeping/app/authentication/models/user.dart';
import 'package:shoeping/app/home/repositories/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  HomeCubit({
    required this.homeRepository,
  }) : super(HomeState.initial());

  Future<void> getUser() async {
    emit(state.copyWith(userStatus: UserStatus.loading));
    try {
      print('test');
      final UserModel userModel = await homeRepository.getUser();
      print('test berhasil');
      print(userModel);
      emit(
          state.copyWith(userStatus: UserStatus.success, userModel: userModel));
    } catch (e) {
      print(e);
      emit(state.copyWith(userStatus: UserStatus.error));
    }
  }
}
