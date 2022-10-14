import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shoeping/app/home/screens/home_page/home_page.dart';
import 'package:shoeping/app/notification/screens/notification_page.dart';
import 'package:shoeping/config/theme.dart';

import '../../../config/constant.dart';
import '../../profile/screens/profile_page.dart';
import '../../wishlist/screens/wishlist_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  List<Widget> pages = [
    const HomePage(),
    const WishlistPage(),
    const NotificationPage(),
    const ProfilePage()
  ];

  List<IconData> icons = [
    MdiIcons.homeOutline,
    MdiIcons.heartOutline,
    MdiIcons.bellOutline,
    MdiIcons.account,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(index: selectedIndex, children: pages),
          Align(
            alignment: const Alignment(0, 1),
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              width: AppSizes.phoneWidth(context),
              height: 100,
              decoration: BoxDecoration(
                color: lighterBlack,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: icons
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = icons.indexOf(e);
                          });
                        },
                        child: Icon(
                          e,
                          color: icons.indexOf(e) == selectedIndex
                              ? mainColor
                              : secondaryColor,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
