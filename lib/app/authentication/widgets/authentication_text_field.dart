import 'package:flutter/material.dart';

import '../../../config/theme.dart';

class AuthenticationTextField extends StatelessWidget {
  final String hint;
  final Icon icon;
  final TextEditingController controller;
  final bool isPassword;
  final Icon? suffixIcon;
  const AuthenticationTextField({
    Key? key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.isPassword = false,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: mediumText.copyWith(color: Colors.white),
      obscureText: isPassword ? true : false,
      decoration: InputDecoration(
        prefixIcon: icon,
        suffixIcon: isPassword ? suffixIcon : null,
        hintText: hint,
        hintStyle: mediumLightText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: secondaryColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: secondaryColor),
        ),
      ),
    );
  }
}
