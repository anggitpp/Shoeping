import 'package:flutter/material.dart';
import 'package:shoeping/app/checkout/widgets/shipping_address_box.dart';

import '../../../config/constant.dart';
import '../../../config/theme.dart';
import '../../../widgets/submit_button.dart';
import '../../../widgets/submit_button_with_icon.dart';

class OrderSuccessModalBottomSheet extends StatelessWidget {
  const OrderSuccessModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      padding: const EdgeInsets.symmetric(vertical: AppSizes.defaultMargin),
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
          Container(
            width: 120,
            height: 120,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: lighterBlack),
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: 64,
            ),
          ),
          SizedBox(
            height: 36,
          ),
          Text(
            'Order Successful',
            style: veryLargeText.copyWith(fontSize: 22),
          ),
          SizedBox(height: 8),
          Text(
            'You have successfuly made order',
            style: mediumText,
          ),
          SizedBox(height: 36),
          SubmitButton(
            text: 'View Order',
            onTap: () {},
          ),
          SizedBox(height: 18),
          SubmitButton(
            text: 'Back to Home',
            onTap: () {},
            isDark: true,
          ),
        ],
      ),
    );
  }
}
