import 'package:flutter/material.dart';
import 'package:shoeping/app/authentication/cubits/registration/registration_cubit.dart';
import 'package:shoeping/app/authentication/widgets/authentication_text_field.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/config/route_name.dart';
import 'package:shoeping/config/theme.dart';
import 'package:shoeping/shared/widgets/error_dialog.dart';
import 'package:shoeping/shared/widgets/form_validator.dart';
import 'package:shoeping/shared/widgets/submit_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _retypePasswordController = TextEditingController();

  bool isVisiblePassword = false;
  bool isVisibleRetypePassword = false;

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();

    context.read<RegistrationCubit>().signUp(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, RegistrationState>(
      listener: (context, state) {
        if (state.registrationStatus == RegistrationStatus.error) {
          errorDialog(context, state.error);
        }

        if (state.registrationStatus == RegistrationStatus.success) {
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
                          GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  duration: const Duration(seconds: 2),
                                  backgroundColor: mainColor,
                                  margin: EdgeInsets.only(
                                      bottom:
                                          AppSizes.phoneHeight(context) - 140,
                                      left: AppSizes.defaultMargin,
                                      right: AppSizes.defaultMargin),
                                  content: Text(
                                    'Sorry, still developing that feature, please use form instead',
                                    style: mediumText.copyWith(
                                        color: Colors.black),
                                  ),
                                ),
                              );
                            },
                            child: Container(
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
                                    style: mediumLightText.copyWith(
                                        color: Colors.white),
                                  ),
                                ],
                              ),
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
                            hint: 'Type your name',
                            icon: Icon(
                              Icons.note_alt_outlined,
                              color: secondaryColor,
                            ),
                            controller: _nameController,
                            validator: (String? value) =>
                                FormValidator.validateText(value, 'Name',
                                    minLength: 2),
                          ),
                          AuthenticationTextField(
                            hint: 'Type your email',
                            icon: Icon(
                              Icons.email_outlined,
                              color: secondaryColor,
                            ),
                            controller: _emailController,
                            validator: (String? value) =>
                                FormValidator.validateEmail(value),
                          ),
                          AuthenticationTextField(
                            isPassword: true,
                            suffixIcon: Icons.visibility_off,
                            isVisible: isVisiblePassword,
                            hint: 'Type your password',
                            onTapSuffixIcon: () {
                              setState(() {
                                isVisiblePassword = !isVisiblePassword;
                              });
                            },
                            icon: Icon(
                              Icons.lock_outline,
                              color: secondaryColor,
                            ),
                            controller: _passwordController,
                            validator: (String? value) =>
                                FormValidator.validateText(value, 'Password',
                                    minLength: 6),
                          ),
                          AuthenticationTextField(
                            isPassword: true,
                            suffixIcon: Icons.visibility_off,
                            hint: 'Type your confirm password',
                            isVisible: isVisibleRetypePassword,
                            onTapSuffixIcon: () {
                              setState(() {
                                isVisibleRetypePassword =
                                    !isVisibleRetypePassword;
                              });
                            },
                            icon: Icon(
                              Icons.lock_outline,
                              color: secondaryColor,
                            ),
                            controller: _retypePasswordController,
                            validator: (String? value) =>
                                FormValidator.validateRetypeText(
                                    value, _passwordController.text),
                          ),
                          const SizedBox(height: 30),
                          state.registrationStatus !=
                                  RegistrationStatus.submitting
                              ? SubmitButton(
                                  text: 'Sign Up',
                                  onTap: () => _submit(),
                                )
                              : const Center(
                                  child: CircularProgressIndicator(),
                                ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account? ',
                                style: mediumLightText.copyWith(
                                    color: Colors.white),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, RouteName.login),
                                child: Text(
                                  'Sign In',
                                  style: mediumLightText.copyWith(
                                      color: mainColor),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
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
