import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoeping/shared/widgets/submit_button_with_icon.dart';

import '../../../config/constant.dart';
import '../../../config/theme.dart';

class WishlistProductBox extends StatelessWidget {
  const WishlistProductBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: AppSizes.phoneWidthMargin(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: lighterBlack),
                child: Image.asset('assets/images/sepatu/sepatu-1.png'),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Metcon 7',
                    style: largeMediumText,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        'Nike ·',
                        style: mediumMediumText,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        width: 88,
                        height: 27,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: mainColor.withOpacity(0.1),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '52.214 Sold',
                          style: smallMediumText.copyWith(color: mainColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                        .format(1979000),
                    style:
                        largeMediumText.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: lighterBlack,
                ),
                child: Icon(
                  Icons.delete_outline,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: SubmitButtonWithIcon(
                  color: mainColor,
                  text: 'Add to Cart',
                  icon: Icon(
                    Icons.shopping_cart_checkout,
                    color: lighterBlack,
                  ),
                  height: 40,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
