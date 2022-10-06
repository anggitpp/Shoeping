import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.defaultMargin, vertical: 20),
              child: Column(children: [
                HeaderPage(
                  'My Address',
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return Column(
                      children: List.generate(
                        state.userModel!.addresses!.length,
                        (index) =>
                            MyAddressBox(state.userModel!.addresses![index]),
                      ),
                    );
                  },
                ),
              ]),
            ),
            Align(
              alignment: Alignment(0, 0.9),
              child: SubmitButtonWithIcon(
                width: AppSizes.phoneWidthMargin(context),
                text: 'Add New Address',
                onTap: () => Navigator.pushNamed(context, RouteName.addAddress),
                icon: Icon(Icons.add),
                isDark: true,
                color: lighterBlack,
              ),
            )
          ],
        ),
      ),
    );
  }
}
