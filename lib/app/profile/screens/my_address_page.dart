import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeping/app/authentication/models/user_address.dart';
import 'package:shoeping/app/profile/screens/widgets/my_address_box.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/route_name.dart';
import 'package:shoeping/config/theme.dart';
import 'package:shoeping/shared/widgets/header_page.dart';
import 'package:shoeping/shared/widgets/submit_button_with_icon.dart';

import '../../home/cubit/home_cubit.dart';

class MyAddressPage extends StatelessWidget {
  const MyAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.defaultMargin, vertical: 20),
                child: Column(children: [
                  HeaderPage(
                    'My Address',
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      state.userModel!.addresses!.sort((a, b) =>
                          a.status.toString().compareTo(b.status.toString()));

                      return Column(
                        children: List.generate(
                          state.userModel!.addresses!.length,
                          (index) =>
                              MyAddressBox(state.userModel!.addresses![index]),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ]),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.9),
              child: SubmitButtonWithIcon(
                width: AppSizes.phoneWidthMargin(context),
                text: 'Add New Address',
                onTap: () => Navigator.pushNamed(context, RouteName.addAddress),
                icon: const Icon(Icons.add),
                isDark: true,
                color: lightGrey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
