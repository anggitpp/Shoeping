import 'package:flutter/material.dart';

import '../config/theme.dart';

class HeaderPage extends StatelessWidget {
  final Widget? leftWidget;
  final String title;
  final Widget? rightWidget;
  const HeaderPage(
    this.title,
    this.leftWidget, {
    Key? key,
    this.rightWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leftWidget!,
        Text(
          title,
          style: extraLargeText,
        ),
        rightWidget ??
            const SizedBox(
              width: 24,
            ),
      ],
    );
  }
}
