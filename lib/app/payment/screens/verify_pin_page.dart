import 'package:flutter/material.dart';
import 'package:shoeping/app/payment/widgets/order_success_modal_bottom_sheet.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/theme.dart';
import 'package:shoeping/widgets/header_page.dart';
import 'package:shoeping/widgets/submit_button.dart';

import '../../authentication/widgets/verification_box.dart';

class VerifyPinPage extends StatelessWidget {
  const VerifyPinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultMargin),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderPage(
                    'Enter Your Pin',
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 36),
                  Text(
                    'Enter your PIN to confirm payment',
                    style: mediumText,
                  ),
                  SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: VerificationBox(4),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot PIN?',
                        style: mediumText.copyWith(color: mainColor),
                      )
                    ],
                  ),
                ],
              ),
              Align(
                alignment: const Alignment(0, 0.8),
                child: SubmitButton(
                  text: 'Continue',
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return OrderSuccessModalBottomSheet();
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
