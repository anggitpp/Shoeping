import 'package:flutter/material.dart';

import '../../../config/constant.dart';
import '../../../config/theme.dart';
import '../../../shared/widgets/submit_button_with_icon.dart';
import 'cart_product_box.dart';

class RemoveModalBottomSheet extends StatelessWidget {
  const RemoveModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.all(AppSizes.defaultMargin),
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
          const SizedBox(
            height: 16,
          ),
          Text(
            'Remove From Cart?',
            style: extraLargeTitleText.copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 16,
          ),
          const CartProductBox(),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              SubmitButtonWithIcon(
                color: lighterBlack,
                text: 'Cancel',
                icon: const Icon(Icons.highlight_remove, color: Colors.white),
                isDark: true,
                width: AppSizes.phoneWidthMargin(context) / 2 - 6,
                onTap: () => Navigator.pop(context),
              ),
              const SizedBox(
                width: 12,
              ),
              SubmitButtonWithIcon(
                color: redColor,
                text: 'Remove',
                icon: const Icon(Icons.delete_outline, color: Colors.white),
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
