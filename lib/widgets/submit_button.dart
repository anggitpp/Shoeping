import 'package:flutter/material.dart';

import '../config/constant.dart';
import '../config/theme.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final bool isDark;
  const SubmitButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.isDark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.phoneWidthMargin(context),
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: isDark ? lighterBlack : mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: mediumMediumText.copyWith(
              color: isDark ? Colors.white : backgroundColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
