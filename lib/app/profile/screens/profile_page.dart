import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shoeping/app/authentication/cubits/login/login_cubit.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/route_name.dart';
import 'package:shoeping/shared/widgets/default_divider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/profile_data.dart';
import '../widgets/profile_page_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSizes.defaultMargin),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  const ProfileDataWidget(),
                  const DefaultDivider(),
                  const SizedBox(height: 24),
                  ProfilePageItem(
                    icon: Icons.person_outline,
                    text: 'Edit Profile',
                    onTap: () =>
                        Navigator.pushNamed(context, RouteName.editProfile),
                  ),
                  ProfilePageItem(
                    icon: MdiIcons.mapMarkerOutline,
                    text: 'My Address',
                    onTap: () =>
                        Navigator.pushNamed(context, RouteName.myAddress),
                  ),
                  const ProfilePageItem(
                    icon: MdiIcons.walletOutline,
                    text: 'Payment Method',
                  ),
                  const ProfilePageItem(
                    icon: MdiIcons.bellOutline,
                    text: 'Notification Settings',
                  ),
                  const ProfilePageItem(
                    icon: MdiIcons.shieldOutline,
                    text: 'Security & Privacy',
                  ),
                  const ProfilePageItem(
                    icon: MdiIcons.phoneOutline,
                    text: 'Help Center',
                  ),
                  ProfilePageItem(
                    icon: MdiIcons.exitToApp,
                    text: 'Log Out',
                    color: Colors.redAccent,
                    onTap: () => context.read<LoginCubit>().signOut(),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
