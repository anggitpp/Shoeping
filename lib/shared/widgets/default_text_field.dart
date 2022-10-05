import 'package:flutter/material.dart';

import '../../config/theme.dart';

class DefaultTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool isEnabled;
  final String? Function(String?)? validator;
  final String? initialValue;

  const DefaultTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.isEnabled = true,
    this.validator,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        enabled: isEnabled,
        style: mediumText.copyWith(color: Colors.white),
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: secondaryColor,
          ),
          hintText: hintText,
          hintStyle: mediumLightText,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: secondaryColor),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: secondaryColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: secondaryColor),
          ),
        ),
      ),
    );
  }
}
