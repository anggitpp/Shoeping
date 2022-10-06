import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeping/app/home/cubit/home_cubit.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/shared/widgets/error_dialog.dart';

import '../../../config/theme.dart';

class ProfileDataWidget extends StatelessWidget {
  const ProfileDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.userStatus == UserStatus.error) {
          errorDialog(context, state.error);
        }
      },
      builder: (context, state) {
        return state.userStatus == UserStatus.success
            ? Column(
                children: [
                  Text(
                    'Your Profile',
                    style: extraLargeTitleText,
                  ),
                  const SizedBox(height: 34),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: state.userModel!.photo.isEmpty
                          ? const DecorationImage(
                              image: AssetImage('assets/images/profile/me.png'),
                              fit: BoxFit.cover,
                            )
                          : DecorationImage(
                              image: NetworkImage(
                                  imageAPIURL + state.userModel!.photo)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.userModel!.name,
                    style: veryLargeText.copyWith(fontSize: 22),
                  ),
                  const SizedBox(height: 6),
                  Text(state.userModel!.email, style: mediumText),
                  const SizedBox(height: 36),
                ],
              )
            : const SizedBox(
                width: 200,
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
      },
    );
  }
}
