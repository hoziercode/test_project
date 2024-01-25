import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_project/common/config/helper_style.dart';
import 'package:test_project/common/config/static_text.dart';
import 'package:test_project/common/reuseables/test_project_button.dart';
import 'package:test_project/common/reuseables/test_project_textfield.dart';
import 'package:test_project/logic/providers/authentication_provider.dart';
import 'package:test_project/theme/color_pallete.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AutheticationProvider(ctx: context),
      child: Consumer<AutheticationProvider>(builder: (
        context,
        auth,
        child,
      ) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Pallete.blackColor,
            ),
            centerTitle: true,
            automaticallyImplyLeading: true,
            title: Text(
              StaticText.forgotPassword2,
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
                      Text(
                        StaticText.dontWorry,
                        style: HelperStyle.textStyle(
                          Pallete.blackColor,
                          16.sp,
                          FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      TestProjectTextField(
                        labelText: StaticText.email,
                        hintText: StaticText.enter,
                        keyboardType: TextInputType.emailAddress,
                        validator: (e) => auth.validateEmail(e!),
                      ),
                      SizedBox(
                        height: 80.h,
                      ),
                      TestProjectButton(
                        onPressed: () {
                          auth.submitEmail();
                        },
                        backgroundColor: Pallete.secondaryColor,
                        textColor: Pallete.whiteColor,
                        width: 1.sw,
                        isRow: false,
                        title: StaticText.subMit,
                        height: 50.h,
                      ),
                      TestProjectButton(
                        elevation: 0,
                        onPressed: () {
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
          ),
        );
      }),
    );
  }
}
