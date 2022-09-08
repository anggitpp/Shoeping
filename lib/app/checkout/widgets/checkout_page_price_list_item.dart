import 'package:flutter/material.dart';

import '../../../config/theme.dart';

class CheckoutPagePriceListItem extends StatelessWidget {
  final String title;
  final String item;
  final String? discount;
  const CheckoutPagePriceListItem({
    Key? key,
    required this.title,
    required this.item,
    this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Text(
            title,
            style: mediumText,
          ),
          const Spacer(),
          discount != null
              ? Text(
                  '$discount ',
                  style: mediumMediumText.copyWith(
                      decoration: TextDecoration.lineThrough),
                )
              : const SizedBox(),
          Text(
            item,
            style: mediumMediumText.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
