import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../app/authentication/widgets/verification_box.dart';
import '../../../config/constant.dart';
import '../../../config/theme.dart';
import '../../../widgets/submit_button.dart';

class CreatePinPage extends StatelessWidget {
  const CreatePinPage({Key? key}) : super(key: key);

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
                'Create your PIN',
                style: veryLargeText,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Last step, create your PIN number for security',
                style: mediumLightText,
              ),
              const SizedBox(
                height: 35,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: VerificationBox(4),
              ),
              const SizedBox(
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
