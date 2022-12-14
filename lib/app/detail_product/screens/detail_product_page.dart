import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/route_name.dart';
import 'package:shoeping/config/theme.dart';
import 'package:shoeping/shared/models/product.dart';

import '../../../shared/widgets/default_divider.dart';
import '../../home/cubit/home_cubit.dart';
import 'widgets/detail_product_image.dart';
import 'widgets/size.dart';

class DetailProductPage extends StatelessWidget {
  final Product product;
  const DetailProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, // Color for Android
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: AppSizes.phoneWidth(context),
              height: 244,
              color: lightGrey,
            ),
            SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.defaultMargin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Detail Product',
                              style: extraLargeText,
                            ),
                            GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, RouteName.cart),
                              child: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        DetailProductImage(product.images!),
                        const SizedBox(
                          height: 17,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: veryLargeText.copyWith(fontSize: 22),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${product.brandName} ??',
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
                                        '12.512 Sold',
                                        style: smallMediumText.copyWith(
                                            color: mainColor),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Icon(Icons.star,
                                        color: orangeColor, size: 18),
                                    Text(
                                      '5.0 ',
                                      style: mediumText.copyWith(
                                          color: orangeColor),
                                    ),
                                    Text(
                                      '(6.828)',
                                      style: mediumText.copyWith(
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            BlocBuilder<HomeCubit, HomeState>(
                              builder: (context, state) {
                                return Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: lighterBlack,
                                  ),
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    onPressed: () => state.userModel!.wishlists!
                                            .any((element) =>
                                                element.product == product)
                                        ? context
                                            .read<HomeCubit>()
                                            .removeWishlist(product)
                                        : context
                                            .read<HomeCubit>()
                                            .addWishlist(product),
                                    icon: Icon(Icons.favorite,
                                        color: state.userModel!.wishlists!.any(
                                                (element) =>
                                                    element.product == product)
                                            ? Colors.red
                                            : Colors.white),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          width: AppSizes.phoneWidthMargin(context),
                          height: 1,
                          color: darkGreyColor,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Description',
                          style: mediumMediumText.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        RichText(
                          text: TextSpan(
                            style: smallText.copyWith(color: Colors.white),
                            children: [
                              TextSpan(
                                text: product.description,
                              ),
                              TextSpan(
                                text: ' Read More',
                                style: smallText.copyWith(color: mainColor),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Size (US)',
                          style: mediumMediumText.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizeWidget(sizes: product.sizes!),
                        const SizedBox(
                          height: 18,
                        ),
                        const DefaultDivider(),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Price',
                                  style: mediumText,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          decimalDigits: 0,
                                          symbol: 'IDR ')
                                      .format(product.price),
                                  style: extraLargeText,
                                )
                              ],
                            ),
                            SizedBox(
                              width: AppSizes.phoneWidthMargin(context) / 2,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: mainColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Add to Cart',
                                      style: mediumMediumText.copyWith(
                                          color: backgroundColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Icon(
                                      Icons.shopping_cart_outlined,
                                      color: darkerBlack,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
