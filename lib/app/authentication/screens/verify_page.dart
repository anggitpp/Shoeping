import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoeping/app/authentication/widgets/verification_box.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/theme.dart';
import 'package:shoeping/shared/widgets/submit_button.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, // Color for Android
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));
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
                'Verify Code',
                style: veryLargeText,
              ),
              const SizedBox(
                height: 12,
              ),
              RichText(
                text: TextSpan(
                  style: largeText.copyWith(height: 1.5),
                  children: [
                    const TextSpan(
                      text:
                          'Please enter the code we just sent to your phone number ',
                    ),
                    TextSpan(
                      text: '085155410987',
                      style: largeText.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: VerificationBox(4),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: largeText.copyWith(height: 1.5),
                    children: [
                      const TextSpan(
                        text: 'Resend code in ',
                      ),
                      TextSpan(
                        text: '00:22',
                        style: largeText.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SubmitButton(text: 'Continue', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
