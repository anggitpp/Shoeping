import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:shoeping/shared/models/product.dart';
import 'package:shoeping/shared/widgets/submit_button_with_icon.dart';

import '../../../config/constant.dart';
import '../../../config/theme.dart';
import '../../home/cubit/home_cubit.dart';

class WishlistProductBox extends StatelessWidget {
  final Product product;
  const WishlistProductBox({
    Key? key,
    required this.product,
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
                child: Image.network(
                  imageAPIURL + product.image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: largeMediumText,
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
                            locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                        .format(product.price),
                    style:
                        largeMediumText.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: lighterBlack,
                ),
                child: IconButton(
                  onPressed: () {
                    context.read<HomeCubit>().removeWishlist(product);
                  },
                  icon: const Icon(Icons.delete_outline),
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
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
