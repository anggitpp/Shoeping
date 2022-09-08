import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/theme.dart';
import 'package:shoeping/widgets/submit_button_with_icon.dart';

import '../widgets/cart_product_box.dart';
import '../widgets/remove_modal_bottom_sheet.dart';

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
                padding: const EdgeInsets.all(AppSizes.defaultMargin),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        Text(
                          'My Carts',
                          style: extraLargeText,
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/store/adidas.png'),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle),
                          alignment: Alignment.center,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Nike Official Store',
                          style: largeMediumText,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const CartProductBox(),
                    const SizedBox(
                      height: 22,
                    ),
                    GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context) {
                                return const RemoveModalBottomSheet();
                              });
                        },
                        child: const CartProductBox()),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: AppSizes.phoneWidth(context),
                height: 100,
                padding: const EdgeInsets.all(AppSizes.defaultMargin),
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
                        const SizedBox(
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
                    SubmitButtonWithIcon(
                        color: mainColor,
                        text: 'Checkout',
                        icon: Icon(
                          Icons.arrow_forward,
                          color: backgroundColor,
                        ))
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
