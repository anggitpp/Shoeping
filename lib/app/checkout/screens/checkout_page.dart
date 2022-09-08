import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shoeping/app/checkout/widgets/checkout_product_box.dart';
import 'package:shoeping/app/checkout/widgets/choose_address_modal_bottom_sheet.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/theme.dart';
import 'package:shoeping/widgets/default_divider.dart';
import 'package:shoeping/widgets/header_page.dart';

import '../../../widgets/submit_button_with_icon.dart';
import '../widgets/checkout_page_price_list_item.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    const HeaderPage(
                      'Checkout',
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Shipping Address',
                      style: largeMediumText,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: lighterBlack,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: mainColor.withOpacity(0.1),
                            ),
                            child: Icon(
                              MdiIcons.mapMarker,
                              color: mainColor,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rumah Anggit',
                                style: mediumText.copyWith(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Jl. Bintara VIII No. 42',
                                style: smallText,
                              ),
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: ((context) {
                                    return const ChooseAddressModalBottomSheet();
                                  }));
                            },
                            child: const Icon(
                              MdiIcons.pencil,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Order List',
                      style: largeMediumText,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: List.generate(
                        5,
                        (index) => const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: CheckoutProductBox(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Promo Code',
                      style: largeMediumText,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: lighterBlack,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            MdiIcons.brightnessPercent,
                            color: mainColor,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Use discount coupons to save',
                            style: mediumText,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const DefaultDivider(),
                    const SizedBox(
                      height: 24,
                    ),
                    const CheckoutPagePriceListItem(
                      title: 'Quantity',
                      item: '4 Items',
                    ),
                    CheckoutPagePriceListItem(
                      title: 'Amount',
                      item: NumberFormat.currency(
                              locale: 'id', decimalDigits: 0, symbol: 'IDR ')
                          .format(12017000),
                    ),
                    CheckoutPagePriceListItem(
                      title: 'Shipping',
                      item: NumberFormat.currency(
                              locale: 'id', decimalDigits: 0, symbol: 'IDR ')
                          .format(0),
                      discount: NumberFormat.currency(
                              locale: 'id', decimalDigits: 0, symbol: 'IDR ')
                          .format(120000),
                    ),
                    CheckoutPagePriceListItem(
                      title: 'Tax',
                      item: NumberFormat.currency(
                              locale: 'id', decimalDigits: 0, symbol: 'IDR ')
                          .format(50000),
                    ),
                    CheckoutPagePriceListItem(
                      title: 'Total',
                      item: NumberFormat.currency(
                              locale: 'id', decimalDigits: 0, symbol: 'IDR ')
                          .format(12517000),
                    ),
                    const SizedBox(
                      height: 80,
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
                child: SubmitButtonWithIcon(
                  width: AppSizes.phoneWidthMargin(context),
                  color: mainColor,
                  text: 'Continue to Payment',
                  icon: Icon(
                    Icons.arrow_forward,
                    color: backgroundColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
