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
          padding: const EdgeInsets.all(AppSizes.defaultMargin),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Your Profile',
                  style: extraLargeTitleText,
                ),
                SizedBox(height: 34),
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile/me.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(1, 0.9),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: mainColor),
                          child: Icon(
                            Icons.edit,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Bimo Ability',
                  style: veryLargeText.copyWith(fontSize: 22),
                ),
                SizedBox(height: 6),
                Text('+62 812 9293 0923', style: mediumText),
                SizedBox(height: 36),
                DefaultDivider(),
                SizedBox(height: 24),
                ProfilePageItem(
                  icon: Icons.person_outline,
                  text: 'Edit Profile',
                ),
                ProfilePageItem(
                  icon: MdiIcons.mapMarkerOutline,
                  text: 'My Address',
                ),
                ProfilePageItem(
                  icon: MdiIcons.walletOutline,
                  text: 'Payment Method',
                ),
                ProfilePageItem(
                  icon: MdiIcons.bellOutline,
                  text: 'Notification Settings',
                ),
                ProfilePageItem(
                  icon: MdiIcons.shieldOutline,
                  text: 'Security & Privacy',
                ),
                ProfilePageItem(
                  icon: MdiIcons.phoneOutline,
                  text: 'Help Center',
                ),
                ProfilePageItem(
                  icon: MdiIcons.exitToApp,
                  text: 'Log Out',
                  color: Colors.redAccent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
