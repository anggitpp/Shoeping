import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeping/app/home/cubit/home_cubit.dart';

import '../../../config/theme.dart';

class ProfileDataWidget extends StatelessWidget {
  const ProfileDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.userStatus == UserStatus.success
            ? Column(
                children: [
                  Text(
                    'Your Profile',
                    style: extraLargeTitleText,
                  ),
                  const SizedBox(height: 34),
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Stack(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/profile/me.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(1, 0.9),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: mainColor),
                            child: const Icon(
                              Icons.edit,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.userModel!.name,
                    style: veryLargeText.copyWith(fontSize: 22),
                  ),
                  const SizedBox(height: 6),
                  Text('+62 812 9293 0923', style: mediumText),
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
