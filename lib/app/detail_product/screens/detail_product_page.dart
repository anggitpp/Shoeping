import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/theme.dart';

import '../../../widgets/default_divider.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, // Color for Android
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));
    List<String> sizes = ['5', '5.5', '6.5', '7', '8.5'];
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
                            const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            Text(
                              'Detail Product',
                              style: extraLargeText,
                            ),
                            const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          width: AppSizes.phoneWidthMargin(context),
                          padding: const EdgeInsets.all(16),
                          height: 302,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: lighterBlack,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/sepatu/sepatu-1.png',
                                width: 244,
                                height: 200,
                              ),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  5,
                                  (index) => Container(
                                    padding: const EdgeInsets.all(6),
                                    width: 49,
                                    height: 46,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: darkerBlack,
                                    ),
                                    child: Image.asset(
                                        'assets/images/sepatu/sepatu-1.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Metcon 8 Superblack',
                                  style: veryLargeText.copyWith(fontSize: 22),
                                ),
                                const SizedBox(
                                  height: 5,
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
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: lighterBlack,
                              ),
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/icons/love-icon.png',
                                width: 24,
                                height: 24,
                              ),
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
                              const TextSpan(
                                text:
                                    'You chase the clock, challenging & encouraging each other all in the name of achieving goals & making gains. ',
                              ),
                              TextSpan(
                                text: 'Read More',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: sizes
                              .map(
                                (e) => Container(
                                  width: 54,
                                  height: 54,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: lighterBlack),
                                  alignment: Alignment.center,
                                  child: Text(
                                    e,
                                    style: extraLargeText,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
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
                                      .format(3195953),
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
