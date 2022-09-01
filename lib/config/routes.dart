import 'package:shoeping/app/authentication/screens/confirm_pin_page.dart';
import 'package:shoeping/app/authentication/screens/create_pin_page.dart';
import 'package:shoeping/app/authentication/screens/reset_password_page.dart';
import 'package:shoeping/app/authentication/screens/verified_page.dart';
import 'package:shoeping/app/authentication/screens/verify_reset_password_page.dart';

import '../app/authentication/screens/verify_page.dart';
import '../app/authentication/screens/login_page.dart';
import '../app/authentication/screens/registration_page.dart';

import '../config/route_name.dart';

final routes = {
  RouteName.home: (context) => const ResetPasswordPage(),
  RouteName.registration: (context) => const RegistrationPage(),
  RouteName.login: (context) => const LoginPage(),
  RouteName.verify: (context) => const VerifyPage(),
  RouteName.verified: (context) => const VerifiedPage(),
  RouteName.createPin: (context) => const CreatePinPage(),
  RouteName.confirmPin: (context) => const ConfirmPinPage(),
  RouteName.verifyReset: (context) => const VerifyResetPasswordPage(),
  RouteName.resetPassword: (context) => const ResetPasswordPage(),
};
