import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shoeping/app/notification/widgets/notification_widget.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/theme.dart';
import 'package:shoeping/shared/widgets/default_divider.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  double marginNotificationBox = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 27,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.defaultMargin),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Notification', style: largeMediumText),
                      Icon(Icons.settings_outlined, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 24),
                  DefaultDivider(),
                  SizedBox(height: 24),
                ],
              ),
            ),
            NotificationWidget(),
            NotificationWidget(),
          ],
        ),
      ),
    );
  }
}
