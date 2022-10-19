import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shoeping/app/home/cubit/home_cubit.dart';
import 'package:shoeping/app/home/models/last_seen.dart';
import 'package:shoeping/config/route_name.dart';
import 'package:shoeping/shared/models/product.dart';
import 'package:shoeping/shared/widgets/default_divider.dart';

import '../../../../../config/constant.dart';
import '../../../../../config/theme.dart';
import '../../../../../shared/widgets/product_box.dart';

class LastSeenWidget extends StatelessWidget {
  final List<Product> products;
  final List<LastSeen> lastSeens;
  const LastSeenWidget({
    Key? key,
    required this.products,
    required this.lastSeens,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Last Seen',
                style: largeMediumText,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: lastSeens.map((e) {
              final product =
                  products.firstWhere((element) => element.id == e.productId);
              return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                        context,
                        RouteName.detailProduct,
                        arguments: product,
                      ),
                  child: ProductBox(product));
            }).toList(),
          ),
          SizedBox(height: 20),
          DefaultDivider(),
        ],
      ),
    );
  }
}
