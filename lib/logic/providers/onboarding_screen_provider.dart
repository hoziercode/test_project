import 'package:flutter/material.dart';
import 'package:test_project/database/hive_db.dart';
import 'package:test_project/router/router_constant.dart';

class OnboardingScreenProvider extends ChangeNotifier {
  OnboardingScreenProvider({required BuildContext ctx}) {
    context = ctx;
    debugPrint("onboarding screen provider init  $hashCode");
  }

  @override
  void dispose() {
    debugPrint("onboarding screen provider dispose $hashCode");
    super.dispose();
  }

  BuildContext? context;

  Future<void> getStarted() async {
    await MyHiveBox.saveBool("ONBOARDING", true);
    Navigator.of(context!).pushNamedAndRemoveUntil(
      RoutePaths.registerScreen,
      (route) => false,
    );
  }
}
