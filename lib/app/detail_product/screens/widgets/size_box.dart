import 'package:flutter/material.dart';

import '../../../../config/theme.dart';

class SizeBox extends StatelessWidget {
  final String size;
  final Color backgroundColor;
  final Color textColor;
  const SizeBox({
    Key? key,
    required this.size,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: backgroundColor),
      alignment: Alignment.center,
      child: Text(
        size,
        style: extraLargeText.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}
