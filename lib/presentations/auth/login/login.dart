import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_project/common/config/helper_style.dart';
import 'package:test_project/common/config/static_text.dart';
import 'package:test_project/common/reuseables/test_project_button.dart';
import 'package:test_project/common/reuseables/test_project_textfield.dart';
import 'package:test_project/logic/providers/authentication_provider.dart';
import 'package:test_project/router/router_constant.dart';
import 'package:test_project/theme/color_pallete.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, this.showBackButton});
  final bool? showBackButton;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AutheticationProvider(ctx: context),
      child: Consumer<AutheticationProvider>(builder: (context, auth, child) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Pallete.blackColor,
            ),
            centerTitle: true,
            automaticallyImplyLeading: showBackButton ?? false,
            title: Text(
              StaticText.signIn,
              style: HelperStyle.textStyle(
                Pallete.blackColor,
                24.sp,
                FontWeight.w600,
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Form(
                  key: auth.formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          StaticText.welComeBack,
                          style: HelperStyle.textStyle(
                            Pallete.blackColor,
                            16.sp,
                            FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      TestProjectTextField(
                        labelText: StaticText.email,
                        hintText: StaticText.enter,
                        validator: (e) => auth.validateEmail(e!),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TestProjectTextField(
                        obscureText: auth.isObsured,
                        labelText: StaticText.password,
                        hintText: StaticText.enter,
                        validator: (e) => auth.validatePassword(e!),
                        suffixIcon: InkWell(
                          onTap: () {
                            auth.setIsObsured();
                          },
                          child: Icon(
                            auth.isObsured
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 25.sp,
                            color: Pallete.hintColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutePaths.forgotPassword,
                          );
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            StaticText.forgotPassword,
                            style: HelperStyle.textStyle(
                              Pallete.hintColor,
                              12.sp,
                              FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80.h,
                      ),
                      TestProjectButton(
                        onPressed: () {
                          auth.loginUser();
                        },
                        backgroundColor: Pallete.secondaryColor,
                        textColor: Pallete.whiteColor,
                        width: 1.sw,
                        isRow: false,
                        title: StaticText.signIn,
                        height: 50.h,
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutePaths.registerScreen,
                            arguments: {
                              "showBackButton": true,
                            },
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: StaticText.dontHaveAccount,
                            style: HelperStyle.textStyle(
                              Pallete.labelColor,
                              14.sp,
                              FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: StaticText.signUp,
                                style: HelperStyle.textStyle(
                                  Pallete.secondaryColor,
                                  14.sp,
                                  FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
