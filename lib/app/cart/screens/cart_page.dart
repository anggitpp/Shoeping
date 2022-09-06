import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/theme.dart';

import '../widgets/cart_product_box.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, // Color for Android
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(AppSizes.defaultMargin),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        Text(
                          'My Carts',
                          style: extraLargeText,
                        ),
                        SizedBox(
                          width: 24,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/store/adidas.png'),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle),
                          alignment: Alignment.center,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Nike Official Store',
                          style: largeMediumText,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CartProductBox(),
                    SizedBox(
                      height: 22,
                    ),
                    CartProductBox(),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: AppSizes.phoneWidth(context),
                height: 100,
                padding: EdgeInsets.all(AppSizes.defaultMargin),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: borderColor, width: 1)),
                ),
                alignment: Alignment.center,
                child: Row(
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
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(12979000),
                          style: largeMediumText,
                        ),
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
                              'Checkout',
                              style: mediumMediumText.copyWith(
                                  color: backgroundColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: darkerBlack,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
