import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoeping/app/authentication/widgets/authentication_text_field.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/theme.dart';
import 'package:shoeping/widgets/submit_button.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.white, // Color for Android
          statusBarBrightness:
              Brightness.dark // Dark == white status bar -- for IOS.
          ),
    );
    TextEditingController usernameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController retypePasswordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      'assets/logo.png',
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Hello Fish!',
                      style: veryLargeText,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Create your account & enjoy',
                      style: largeText,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
              Container(
                width: AppSizes.phoneWidth(context),
                margin: const EdgeInsets.symmetric(
                    horizontal: AppSizes.defaultMargin),
                child: Column(
                  children: [
                    Container(
                      width: AppSizes.phoneWidth(context),
                      height: 48,
                      decoration: BoxDecoration(
                        color: darkGreyColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/google-logo.png',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Sign Up with Google',
                            style:
                                mediumLightText.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          width: AppSizes.phoneWidthMargin(context) / 2 - 24,
                          height: 1,
                          color: secondaryColor,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          'OR',
                          style: largeText,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: AppSizes.phoneWidthMargin(context) / 2 - 24,
                          height: 1,
                          color: secondaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthenticationTextField(
                      hint: 'Type your username',
                      icon: Icon(
                        Icons.people,
                        color: secondaryColor,
                      ),
                      controller: usernameController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AuthenticationTextField(
                      hint: 'Type your phone number',
                      icon: Icon(
                        Icons.phone_outlined,
                        color: secondaryColor,
                      ),
                      controller: phoneController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AuthenticationTextField(
                      isPassword: true,
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        color: secondaryColor,
                      ),
                      hint: 'Type your password',
                      icon: Icon(
                        Icons.lock_outline,
                        color: secondaryColor,
                      ),
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AuthenticationTextField(
                      isPassword: true,
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        color: secondaryColor,
                      ),
                      hint: 'Type your confirm password',
                      icon: Icon(
                        Icons.lock_outline,
                        color: secondaryColor,
                      ),
                      controller: retypePasswordController,
                    ),
                    const SizedBox(height: 55),
                    SubmitButton(
                      text: 'Sign In',
                      onTap: () {},
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: mediumLightText.copyWith(color: Colors.white),
                        ),
                        Text(
                          'Sign In',
                          style: mediumLightText.copyWith(color: mainColor),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
