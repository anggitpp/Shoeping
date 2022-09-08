import 'package:flutter/material.dart';
import 'package:shoeping/config/theme.dart';

import '../../../config/constant.dart';

class PaymentMethodItem extends StatelessWidget {
  final String groupValue;
  final void Function(String?)? onClickButton;
  final String text;
  final String value;
  final String image;
  const PaymentMethodItem({
    Key? key,
    required this.groupValue,
    this.onClickButton,
    required this.text,
    required this.value,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        tileColor: lighterBlack,
        selectedColor: mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Text(
          text,
          style: mediumMediumText.copyWith(color: Colors.white),
        ),
        leading: Image.asset(
          image,
          width: 36,
          height: 36,
        ),
        trailing: Radio<String>(
          activeColor: mainColor,
          value: value,
          groupValue: groupValue,
          onChanged: onClickButton,
        ),
      ),
    );
  }
}
