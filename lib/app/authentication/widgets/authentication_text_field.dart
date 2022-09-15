import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/theme.dart';

class AuthenticationTextField extends StatelessWidget {
  final String hint;
  final Icon icon;
  final TextEditingController controller;
  final bool isPassword;
  final Icon? suffixIcon;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  // final Function(String?)? onSaved;
  const AuthenticationTextField({
    Key? key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.isPassword = false,
    this.suffixIcon,
    this.textInputType = TextInputType.text,
    this.validator,
    // this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        autocorrect: false,
        keyboardType: textInputType,
        style: mediumText.copyWith(color: Colors.white),
        obscureText: isPassword ? true : false,
        validator: validator,
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
      ),
    );
  }
}
