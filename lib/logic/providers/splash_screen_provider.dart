import 'package:flutter/material.dart';
import 'package:test_project/database/hive_db.dart';
import 'package:test_project/router/router_constant.dart';

class SplashScreenProvider extends ChangeNotifier {
  SplashScreenProvider({
    required BuildContext ctx,
  }) {
    context = ctx;
    startApp();
    debugPrint("splash screen provider init $hashCode");
  }

  @override
  void dispose() {
    debugPrint("splash screen provider dispose $hashCode");
    super.dispose();
  }

  BuildContext? context;

  Future<void> startApp() async {
    final isOnboarding = await MyHiveBox.getBool("ONBOARDING");
    await Future.delayed(const Duration(seconds: 3)).then((value) async {
      if (isOnboarding == true) {
        Navigator.of(context!).pushNamedAndRemoveUntil(
          RoutePaths.loginScreen,
          (route) => false,
        );
      } else {
        Navigator.of(context!).pushNamedAndRemoveUntil(
          RoutePaths.onboardingScreen,
          (route) => false,
        );
      }
    });
  }
}
