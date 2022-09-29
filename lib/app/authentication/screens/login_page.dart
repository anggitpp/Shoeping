import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeping/app/authentication/widgets/authentication_text_field.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/route_name.dart';
import 'package:shoeping/config/theme.dart';
import 'package:shoeping/shared/widgets/default_loading_progress.dart';
import 'package:shoeping/shared/widgets/form_validator.dart';
import 'package:shoeping/shared/widgets/submit_button.dart';

import '../../../shared/widgets/error_dialog.dart';
import '../cubits/login/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  bool isVisible = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();

    context.read<LoginCubit>().signIn(
        email: _emailController.text, password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.loginStatus == LoginStatus.error) {
          errorDialog(context, state.error);
        }

        if (state.loginStatus == LoginStatus.success) {
          Navigator.pushReplacementNamed(context, RouteName.main);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                autovalidateMode: _autovalidateMode,
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
                            'Welcome Back!',
                            style: veryLargeText,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Sign In to your account',
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
                                  'Sign In with Google',
                                  style: mediumLightText.copyWith(
                                      color: Colors.white),
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
                                width:
                                    AppSizes.phoneWidthMargin(context) / 2 - 24,
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
                                width:
                                    AppSizes.phoneWidthMargin(context) / 2 - 24,
                                height: 1,
                                color: secondaryColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AuthenticationTextField(
                            controller: _emailController,
                            hint: 'Type your email',
                            icon: Icon(
                              Icons.phone_outlined,
                              color: secondaryColor,
                            ),
                            validator: (String? value) =>
                                FormValidator.validateEmail(value),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AuthenticationTextField(
                            controller: _passwordController,
                            isPassword: true,
                            isVisible: isVisible,
                            suffixIcon: isVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            onTapSuffixIcon: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            hint: 'Type your password',
                            icon: Icon(
                              Icons.lock_outline,
                              color: secondaryColor,
                            ),
                            validator: (String? value) =>
                                FormValidator.validateText(value, 'Password'),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forgot Password?',
                                style: mediumText.copyWith(color: mainColor),
                              ),
                            ],
                          ),
                          const SizedBox(height: 55),
                          state.loginStatus != LoginStatus.submitting
                              ? SubmitButton(
                                  text: 'Sign In',
                                  onTap: () => _submit(),
                                )
                              : const DefaultLoadingProgress(),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Dont have account? ',
                                style: mediumLightText.copyWith(
                                    color: Colors.white),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, RouteName.registration),
                                child: Text(
                                  'Sign Up',
                                  style: mediumLightText.copyWith(
                                      color: mainColor),
                                ),
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
          ),
        );
      },
    );
  }
}
