import 'package:flutter/material.dart';

import '../../config/constant.dart';
import '../../config/theme.dart';

class SubmitButtonWithIcon extends StatelessWidget {
  final double? width;
  final double? height;
  final Color color;
  final String text;
  final Icon icon;
  final bool isDark;
  final Function()? onTap;
  const SubmitButtonWithIcon({
    Key? key,
    required this.color,
    required this.text,
    required this.icon,
    this.width,
    this.height,
    this.isDark = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? AppSizes.phoneWidthMargin(context) / 2,
      height: height ?? 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        onPressed: onTap ?? () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: mediumMediumText.copyWith(
                  color: isDark ? Colors.white : backgroundColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 6,
            ),
            icon
          ],
        ),
      ),
    );
  }
}
