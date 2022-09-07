import 'package:flutter/material.dart';

import '../../../config/constant.dart';
import '../../../config/theme.dart';
import '../../../widgets/submit_button_with_icon.dart';
import 'cart_product_box.dart';

class RemoveModalBottomSheet extends StatelessWidget {
  const RemoveModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: EdgeInsets.all(AppSizes.defaultMargin),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            width: 26,
            height: 2,
            decoration: BoxDecoration(
                color: borderColor, borderRadius: BorderRadius.circular(3)),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Remove From Cart?',
            style: extraLargeTitleText.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 16,
          ),
          CartProductBox(),
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              SubmitButtonWithIcon(
                color: lighterBlack,
                text: 'Cancel',
                icon: Icon(Icons.highlight_remove, color: Colors.white),
                isDark: true,
                width: AppSizes.phoneWidthMargin(context) / 2 - 6,
                onTap: () => Navigator.pop(context),
              ),
              SizedBox(
                width: 12,
              ),
              SubmitButtonWithIcon(
                color: redColor,
                text: 'Remove',
                icon: Icon(Icons.delete_outline, color: Colors.white),
                isDark: true,
                width: AppSizes.phoneWidthMargin(context) / 2 - 6,
                onTap: () => Navigator.pop(context),
              )
            ],
          ),
        ],
      ),
    );
  }
}
