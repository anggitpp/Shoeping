import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/theme.dart';
import 'package:shoeping/widgets/default_divider.dart';

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
                  SizedBox(height: 24),
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
                    'Bimo Ability',
                    style: veryLargeText.copyWith(fontSize: 22),
                  ),
                  const SizedBox(height: 6),
                  Text('+62 812 9293 0923', style: mediumText),
                  const SizedBox(height: 36),
                  const DefaultDivider(),
                  const SizedBox(height: 24),
                  const ProfilePageItem(
                    icon: Icons.person_outline,
                    text: 'Edit Profile',
                  ),
                  const ProfilePageItem(
                    icon: MdiIcons.mapMarkerOutline,
                    text: 'My Address',
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
                  const ProfilePageItem(
                    icon: MdiIcons.exitToApp,
                    text: 'Log Out',
                    color: Colors.redAccent,
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
