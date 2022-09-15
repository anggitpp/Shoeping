import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/theme.dart';
import 'package:shoeping/shared/widgets/product_box.dart';
import 'package:shoeping/shared/widgets/submit_button_with_icon.dart';

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

    const int totalCart = 0;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.defaultMargin),
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
                    totalCart > 0
                        ? Column(
                            children: [
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
                          )
                        : Container(
                            width: AppSizes.phoneWidthMargin(context),
                            height: 153,
                            decoration: BoxDecoration(
                              color: lighterBlack,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Oops! Your cart is empty',
                                  style: largeMediumText,
                                ),
                                SizedBox(height: 6),
                                Text(
                                  'Lets find something for you',
                                  style: smallText,
                                ),
                                SizedBox(height: 24),
                                Text(
                                  'Explore Product',
                                  style: mediumText.copyWith(color: mainColor),
                                ),
                              ],
                            ),
                          ),
                    SizedBox(height: 24),
                    Text(
                      'Recommended From Nike',
                      style: largeMediumText,
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: AppSizes.phoneWidthMargin(context),
                      child: Wrap(
                        runSpacing: 20,
                        alignment: WrapAlignment.spaceBetween,
                        runAlignment: WrapAlignment.spaceBetween,
                        children:
                            List.generate(4, (index) => ProductBox()).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
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
                  color: backgroundColor,
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
                              .format(totalCart > 0 ? 12979000 : 0),
                          style: largeMediumText,
                        ),
                      ],
                    ),
                    SubmitButtonWithIcon(
                        color: totalCart > 0 ? mainColor : secondaryColor,
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
