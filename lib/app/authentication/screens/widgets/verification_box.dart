import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../config/theme.dart';

class VerificationBox extends StatelessWidget {
  final int length;
  const VerificationBox(
    this.length, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      keyboardType: TextInputType.number,
      enableActiveFill: true,
      appContext: context,
      length: length,
      animationType: AnimationType.fade,
      textStyle: veryLargeText.copyWith(fontWeight: FontWeight.bold),
      onChanged: (string) {
        print(string);
      },
      onCompleted: (string) {
        print(string);
      },
      pinTheme: PinTheme(
        selectedColor: mainColor,
        errorBorderColor: lighterBlack,
        inactiveColor: lighterBlack,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(6),
        fieldHeight: 56,
        fieldWidth: 56,
        activeFillColor: lighterBlack,
        inactiveFillColor: lighterBlack,
        selectedFillColor: lighterBlack,
        activeColor: lighterBlack,
      ),
    );
  }
}
