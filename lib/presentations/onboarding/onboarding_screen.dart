import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_project/common/config/static_text.dart';
import 'package:test_project/common/reuseables/test_project_button.dart';
import 'package:test_project/logic/providers/onboarding_screen_provider.dart';
import 'package:test_project/theme/color_pallete.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingScreenProvider(ctx: context),
      child: Consumer<OnboardingScreenProvider>(
          builder: (context, onboardingScreenProvider, child) {
        return Scaffold(
          body: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  height: 1.sh,
                  width: 1.sw,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Pallete.redColor,
                        Pallete.skyBlue,
                      ],
                    ),
                  ),
                  child: TestProjectButton(
                    onPressed: () {
                      onboardingScreenProvider.getStarted();
                    },
                    backgroundColor: Pallete.whiteColor,
                    textColor: Pallete.skyBlue,
                    width: 230.w,
                    isRow: false,
                    title: StaticText.getStarted,
                  ),
                )
              ]),
            ),
          ),
        );
      }),
    );
  }
}
