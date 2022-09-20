import 'package:flutter/material.dart';
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
            const SizedBox(
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
                      const Icon(Icons.settings_outlined, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const DefaultDivider(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            const NotificationWidget(),
            const NotificationWidget(),
          ],
        ),
      ),
    );
  }
}
