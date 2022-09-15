import 'package:flutter/material.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/theme.dart';
import 'package:shoeping/shared/widgets/submit_button.dart';

class VerifiedPage extends StatelessWidget {
  const VerifiedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Container(
                  width: 124,
                  height: 124,
                  decoration: BoxDecoration(
                    color: lighterBlack,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 65,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Account Verified',
                  style: veryLargeText.copyWith(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: AppSizes.defaultMargin),
                  width: AppSizes.phoneWidthMargin(context),
                  child: Column(
                    children: [
                      Text(
                        'Your account has been verified successfully.',
                        style: largeLightText,
                        textAlign: TextAlign.center,
                      ),
                      RichText(
                        text: TextSpan(
                          style: largeLightText.copyWith(height: 1.5),
                          children: [
                            const TextSpan(
                              text: 'lets enjoy ',
                            ),
                            TextSpan(
                              text: 'Shoeping ',
                              style:
                                  largeLightText.copyWith(color: Colors.white),
                            ),
                            const TextSpan(
                              text: 'featured',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SubmitButton(
                    text: 'Create PIN',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  SubmitButton(
                    text: 'Get Started',
                    onTap: () {},
                    isDark: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
