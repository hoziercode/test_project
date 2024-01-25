// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/common/assets/assets.gen.dart';
import 'package:test_project/common/config/helper_style.dart';
import 'package:test_project/common/config/static_text.dart';
import 'package:test_project/common/reuseables/test_project_button.dart';
import 'package:test_project/router/router_constant.dart';
import 'package:test_project/theme/color_pallete.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final bool confirmExit = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirm Exit'),
              content: const Text('Are you sure you want to quit this app?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Exit'),
                ),
              ],
            );
          },
        );

        return confirmExit;
      },
      child: Scaffold(
        body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.icons.celebration.svg(),
              SizedBox(
                height: 7.h,
              ),
              Text(
                StaticText.successful,
                style: HelperStyle.textStyle(
                  Pallete.labelColor,
                  24.sp,
                  FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                StaticText.you,
                textAlign: TextAlign.center,
                style: HelperStyle.textStyle(
                  Pallete.labelColor,
                  14.sp,
                  FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: TestProjectButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RoutePaths.loginScreen,
                      (route) => false,
                      arguments: {
                        "showBackButton": false,
                      },
                    );
                  },
                  backgroundColor: Pallete.secondaryColor,
                  textColor: Pallete.whiteColor,
                  width: 1.sw,
                  isRow: false,
                  title: StaticText.signIn,
                  height: 50.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
