import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../config/constant.dart';
import '../../config/theme.dart';
import '../models/product.dart';

class ProductBox extends StatelessWidget {
  final Product product;
  const ProductBox(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      height: 206,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            width: 155,
            height: 125,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: lighterBlack,
            ),
            child: Image.network(
              imageAPIURL + product.image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            product.name,
            style: largeText.copyWith(
                color: Colors.white, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(
                '${product.brandName} ·',
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
                    locale: 'id_ID', symbol: 'IDR ', decimalDigits: 0)
                .format(product.price),
            style: mediumMediumText.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
