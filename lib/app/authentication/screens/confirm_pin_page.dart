import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoeping/app/authentication/screens/widgets/verification_box.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/theme.dart';
import 'package:shoeping/widgets/submit_button.dart';

class ConfirmPinPage extends StatelessWidget {
  const ConfirmPinPage({Key? key}) : super(key: key);

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
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Create your PIN',
                style: veryLargeText,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Last step, create your PIN number for security',
                style: mediumLightText,
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: VerificationBox(4),
              ),
              SizedBox(
                height: 80,
              ),
              SubmitButton(text: 'Continue', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
