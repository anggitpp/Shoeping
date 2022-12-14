import 'package:flutter/material.dart';
import 'package:recase/recase.dart';
import 'package:shoeping/app/payment/widgets/payment_method_item.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/route_name.dart';
import 'package:shoeping/config/theme.dart';
import 'package:shoeping/shared/widgets/header_page.dart';

import '../../../shared/widgets/submit_button_with_icon.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  String _groupValue = 'gopay';

  void _onClickButton(String title) {
    return setState(() {
      _groupValue = title;
    });
  }

  List<String> icons = ['gopay', 'dana', 'apple-pay', 'mastercard'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Theme(
          data: ThemeData(
            unselectedWidgetColor: mainColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultMargin),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderPage(
                      'Payment Methods',
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      rightWidget: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Text(
                      'Select the payment method you want to use',
                      style: mediumText,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: icons
                          .map(
                            (e) => PaymentMethodItem(
                              groupValue: _groupValue,
                              text: ReCase(e).titleCase,
                              value: e,
                              image: 'assets/icons/$e-icon.png',
                              onClickButton: (string) =>
                                  _onClickButton(string!),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SubmitButtonWithIcon(
                    width: AppSizes.phoneWidthMargin(context),
                    color: mainColor,
                    text: 'Confirm Payment',
                    icon: Icon(
                      Icons.arrow_forward,
                      color: backgroundColor,
                    ),
                    onTap: () =>
                        Navigator.pushNamed(context, RouteName.verifyPin),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
