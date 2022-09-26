import 'package:flutter/material.dart';

import '../../../config/theme.dart';

class AuthenticationTextField extends StatelessWidget {
  final String hint;
  final Icon icon;
  final TextEditingController controller;
  final bool isPassword;
  final bool isVisible;
  final IconData? suffixIcon;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final Function()? onTapSuffixIcon;
  const AuthenticationTextField(
      {Key? key,
      required this.hint,
      required this.icon,
      required this.controller,
      this.isPassword = false,
      this.isVisible = true,
      this.suffixIcon,
      this.textInputType = TextInputType.text,
      this.validator,
      this.onTapSuffixIcon
      // this.onSaved,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        autocorrect: false,
        keyboardType: textInputType,
        style: mediumText.copyWith(color: Colors.white),
        obscureText: isVisible ? false : true,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: icon,
          suffixIcon: isPassword
              ? IconButton(
                  splashColor: Colors.transparent,
                  onPressed: onTapSuffixIcon,
                  icon: Icon(
                    suffixIcon,
                    color: secondaryColor,
                  ),
                )
              : null,
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
