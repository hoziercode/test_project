import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_project/common/config/helper_style.dart';
import 'package:test_project/common/config/static_text.dart';
import 'package:test_project/common/reuseables/test_project_button.dart';
import 'package:test_project/common/reuseables/test_project_textfield.dart';
import 'package:test_project/logic/providers/authentication_provider.dart';
import 'package:test_project/presentations/auth/register/widgets/phone_textfield.dart';
import 'package:test_project/router/router_constant.dart';
import 'package:test_project/theme/color_pallete.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AutheticationProvider(ctx: context),
      child: Consumer<AutheticationProvider>(builder: (
        context,
        auth,
        child,
      ) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: auth.formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      StaticText.createAnAccountTogetStatrted,
                      style: HelperStyle.textStyle(
                        Pallete.labelColor,
                        16.sp,
                        FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    width: 1.sw,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 190.w,
                          child: TestProjectTextField(
                            labelText: StaticText.firstName,
                            hintText: StaticText.enter,
                            validator: (e) => auth.validateText(e),
                          ),
                        ),
                        SizedBox(
                          width: 190.w,
                          child: TestProjectTextField(
                            labelText: StaticText.lastName,
                            hintText: StaticText.enter,
                            validator: (e) => auth.validateText(e),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  PhoneNumberTextField(auth: auth),
                  SizedBox(
                    height: 15.h,
                  ),
                  TestProjectTextField(
                    labelText: StaticText.email,
                    hintText: StaticText.enter,
                    validator: (e) => auth.validateEmail(e!),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TestProjectTextField(
                    labelText: StaticText.password,
                    hintText: StaticText.enter,
                    validator: (e) => auth.validatePassword(e!),
                    controller: auth.passwordController,
                    obscureText: auth.isObsured1,
                    suffixIcon: InkWell(
                      onTap: () {
                        auth.setIsObsured1();
                      },
                      child: Icon(
                        auth.isObsured1
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: 25.sp,
                        color: Pallete.hintColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TestProjectTextField(
                    labelText: StaticText.confirmPassword,
                    validator: (e) => auth.validatePassword(e!),
                    controller: auth.confirmPassword,
                    obscureText: auth.isObsured,
                    hintText: StaticText.enter,
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
                    height: 80.h,
                  ),
                  TestProjectButton(
                    onPressed: () {
                      auth.registerCustomer();
                    },
                    backgroundColor: Pallete.secondaryColor,
                    textColor: Pallete.whiteColor,
                    width: 1.sw,
                    isRow: false,
                    title: StaticText.createAccount,
                    height: 50.h,
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        RoutePaths.loginScreen,
                        (route) => false,
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: StaticText.haveAnAccount,
                        style: HelperStyle.textStyle(
                          Pallete.labelColor,
                          14.sp,
                          FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: StaticText.signIn,
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
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
