import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_project/common/config/helper_style.dart';
import 'package:test_project/common/config/static_text.dart';
import 'package:test_project/logic/providers/authentication_provider.dart';
import 'package:test_project/presentations/auth/register/components/customer.dart';
import 'package:test_project/presentations/auth/register/components/seller.dart';
import 'package:test_project/theme/color_pallete.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key, this.showBackButton});
  final bool? showBackButton;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AutheticationProvider(ctx: context),
      child: Consumer<AutheticationProvider>(
          builder: (context, autheticationProvider, child) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Pallete.blackColor,
            ),
            centerTitle: true,
            automaticallyImplyLeading: showBackButton ?? false,
            title: Text(
              StaticText.getStarted,
              style: HelperStyle.textStyle(
                Pallete.blackColor,
                24.sp,
                FontWeight.w600,
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            autheticationProvider.setCurrentIndex(0);
                          },
                          child: Text(
                            StaticText.customer,
                            style: HelperStyle.textStyle(
                              autheticationProvider.currentPage == 0
                                  ? Pallete.blackColor
                                  : Pallete.hintColor,
                              16.sp,
                              autheticationProvider.currentPage == 0
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        InkWell(
                          onTap: () {
                            autheticationProvider.setCurrentIndex(1);
                          },
                          child: Text(
                            StaticText.seller,
                            style: HelperStyle.textStyle(
                              autheticationProvider.currentPage == 1
                                  ? Pallete.blackColor
                                  : Pallete.hintColor,
                              16.sp,
                              autheticationProvider.currentPage == 1
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: List.generate(
                        2,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 80.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: autheticationProvider.currentPage == index
                                ? Pallete.secondaryColor
                                : Pallete.borderColor,
                            borderRadius: BorderRadius.circular(
                              2.sp,
                            ),
                          ),
                          margin: EdgeInsets.only(
                            right: 30.w,
                          ),
                          transform: Matrix4.translationValues(
                            14.0,
                            0.0,
                            0.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 1.sw,
                    height: 770.h,
                    child: PageView(
                      onPageChanged: autheticationProvider.setCurrentIndex,
                      children: const [
                        CustomerScreen(),
                        SellerScreen(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
