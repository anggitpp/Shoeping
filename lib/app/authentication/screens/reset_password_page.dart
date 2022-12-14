import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoeping/app/authentication/widgets/authentication_text_field.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/theme.dart';
import 'package:shoeping/shared/widgets/submit_button.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, // Color for Android
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));
    TextEditingController passwordController = TextEditingController();
    TextEditingController retypePasswordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Create New Password',
                style: veryLargeText,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Enter your new password below correctly',
                style: largeLightText,
              ),
              const SizedBox(
                height: 35,
              ),
              AuthenticationTextField(
                  hint: 'Type your new password',
                  icon: Icon(
                    Icons.lock,
                    color: secondaryColor,
                  ),
                  controller: passwordController),
              const SizedBox(
                height: 15,
              ),
              AuthenticationTextField(
                  hint: 'Confirm your new password',
                  icon: Icon(
                    Icons.lock,
                    color: secondaryColor,
                  ),
                  controller: retypePasswordController),
              const SizedBox(
                height: 80,
              ),
              SubmitButton(text: 'Create New Password', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
