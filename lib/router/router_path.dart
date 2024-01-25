// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:test_project/presentations/auth/forgot_pasword/forgot_password.dart';
import 'package:test_project/presentations/auth/login/login.dart';
import 'package:test_project/presentations/auth/register/register.dart';
import 'package:test_project/presentations/auth/reset_password/reset_password.dart';
import 'package:test_project/presentations/auth/success/success.dart';
import 'package:test_project/presentations/auth/verify_otp/verify_otp.dart';
import 'package:test_project/presentations/onboarding/onboarding_screen.dart';
import 'package:test_project/presentations/splash_screen/splash_screen.dart';
import 'package:test_project/router/router_constant.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  Map<String, dynamic>? arguments = settings.arguments as Map<String, dynamic>?;

  switch (settings.name) {
    case '/':
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return const SplashScreen();
      });

    case RoutePaths.splashScreen:
      return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(
          name: RoutePaths.splashScreen,
        ),
        builder: (BuildContext context) {
          return const SplashScreen();
        },
      );

    case RoutePaths.onboardingScreen:
      return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(
          name: RoutePaths.onboardingScreen,
        ),
        builder: (BuildContext context) {
          return const OnboardingScreen();
        },
      );

    case RoutePaths.loginScreen:
      return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(
          name: RoutePaths.loginScreen,
        ),
        builder: (BuildContext context) {
          return LoginScreen(
            showBackButton: arguments?["showBackButton"],
          );
        },
      );

    case RoutePaths.registerScreen:
      return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(
          name: RoutePaths.registerScreen,
        ),
        builder: (BuildContext context) {
          return RegisterScreen(
            showBackButton: arguments?["showBackButton"],
          );
        },
      );

    case RoutePaths.forgotPassword:
      return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(
          name: RoutePaths.forgotPassword,
        ),
        builder: (BuildContext context) {
          return const ForgotPassword();
        },
      );

    case RoutePaths.verifyOtp:
      return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(
          name: RoutePaths.verifyOtp,
        ),
        builder: (BuildContext context) {
          return const VerifyOtp();
        },
      );

    case RoutePaths.successScreen:
      return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(
          name: RoutePaths.successScreen,
        ),
        builder: (BuildContext context) {
          return const SuccessScreen();
        },
      );

    case RoutePaths.resetPassword:
      return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(
          name: RoutePaths.resetPassword,
        ),
        builder: (BuildContext context) {
          return const ResetPassword();
        },
      );

    default:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) {
          return Container();
        },
      );
  }
}
