import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../config/constant.dart';
import '../../../config/theme.dart';

class CheckoutProductBox extends StatelessWidget {
  const CheckoutProductBox({
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
              ),
              Spacer(),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: lighterBlack,
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Text(
                  '2',
                  style: mediumMediumText.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
