import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_project/common/config/helper_style.dart';
import 'package:test_project/common/config/static_text.dart';
import 'package:test_project/common/reuseables/test_project_button.dart';
import 'package:test_project/common/reuseables/text_project_pin_put.dart';
import 'package:test_project/logic/providers/authentication_provider.dart';
import 'package:test_project/theme/color_pallete.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      showSnackbar(context);
    });
  }

  void showSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        "Enter any random number",
        style: HelperStyle.textStyle(
          Pallete.whiteColor,
          14.sp,
          FontWeight.w400,
        ),
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final auth = AutheticationProvider(ctx: context);
        return auth;
      },
      lazy: true,
      child: Consumer<AutheticationProvider>(builder: (context, auth, child) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Pallete.blackColor,
            ),
            centerTitle: true,
            automaticallyImplyLeading: true,
            title: Text(
              StaticText.enterOtp,
              style: HelperStyle.textStyle(
                Pallete.blackColor,
                24.sp,
                FontWeight.w600,
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      StaticText.enterTheAuthPin,
                      style: HelperStyle.textStyle(
                        Pallete.blackColor,
                        16.sp,
                        FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    TestProjectPinput(
                      controller: auth.pinputController,
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    TestProjectButton(
                      onPressed: () {
                        auth.submitPin();
                      },
                      backgroundColor: Pallete.secondaryColor,
                      textColor: Pallete.whiteColor,
                      width: 1.sw,
                      isRow: false,
                      title: StaticText.verify,
                      height: 50.h,
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    InkWell(
                      onTap: () {},
                      child: RichText(
                        text: TextSpan(
                          text: StaticText.didntGetCode,
                          style: HelperStyle.textStyle(
                            Pallete.labelColor,
                            14.sp,
                            FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: StaticText.resend,
                              style: HelperStyle.textStyle(
                                Pallete.secondaryColor,
                                14.sp,
                                FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TestProjectButton(
                      elevation: 0,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      backgroundColor: Pallete.whiteColor,
                      textColor: Pallete.whiteColor,
                      width: 1.sw,
                      isRow: true,
                      height: 50.h,
                      child: SizedBox(
                        width: 1.sw,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              size: 20.sp,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              StaticText.backToSignIn,
                              style: HelperStyle.textStyle(
                                Pallete.labelColor,
                                12.sp,
                                FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
