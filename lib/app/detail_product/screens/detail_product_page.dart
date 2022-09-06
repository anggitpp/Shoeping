import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/theme.dart';

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
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.defaultMargin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            Text(
                              'Detail Product',
                              style: extraLargeText,
                            ),
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          width: AppSizes.phoneWidthMargin(context),
                          padding: EdgeInsets.all(16),
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
                              SizedBox(height: 24),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  5,
                                  (index) => Container(
                                    padding: EdgeInsets.all(6),
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
                        SizedBox(
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
                                SizedBox(
                                  height: 5,
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
                                        '12.512 Sold',
                                        style: smallMediumText.copyWith(
                                            color: mainColor),
                                      ),
                                    ),
                                    SizedBox(
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
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          width: AppSizes.phoneWidthMargin(context),
                          height: 1,
                          color: darkGreyColor,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Description',
                          style: mediumMediumText.copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        RichText(
                          text: TextSpan(
                            style: smallText.copyWith(color: Colors.white),
                            children: [
                              TextSpan(
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
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Size (US)',
                          style: mediumMediumText.copyWith(color: Colors.white),
                        ),
                        SizedBox(
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
                        SizedBox(
                          height: 18,
                        ),
                        Container(
                          width: AppSizes.phoneWidthMargin(context),
                          height: 1,
                          color: darkGreyColor,
                        ),
                        SizedBox(
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
                                SizedBox(
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
                                    SizedBox(
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
                        SizedBox(
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
