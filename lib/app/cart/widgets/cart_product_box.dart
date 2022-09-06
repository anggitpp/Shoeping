import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../config/constant.dart';
import '../../../config/theme.dart';

class CartProductBox extends StatelessWidget {
  const CartProductBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
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
                padding: EdgeInsets.all(6),
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: lighterBlack),
                child: Image.asset('assets/images/sepatu/sepatu-1.png'),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Metcon 7',
                    style: largeMediumText,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        'Nike ·',
                        style: mediumMediumText,
                      ),
                      SizedBox(
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
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                        .format(1979000),
                    style: largeMediumText,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                'assets/icons/love-icon.png',
                width: 16,
                height: 16,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                'Move to Wishlist',
                style: mediumText,
              ),
              Spacer(),
              Icon(
                Icons.delete_outline,
                size: 18,
                color: redColor,
              ),
              SizedBox(
                width: 6,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: lighterBlack,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.remove,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '2',
                      style: mediumText.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
