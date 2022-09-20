import 'package:flutter/material.dart';

import '../../../config/constant.dart';
import '../../../config/theme.dart';
import 'notification_item.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.phoneWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.defaultMargin),
            child: Text(
              'Today',
              style: largeMediumText,
            ),
          ),
          const SizedBox(height: 16),
          const NotificationItem(),
          const NotificationItem(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
