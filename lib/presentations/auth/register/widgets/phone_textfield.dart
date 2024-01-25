import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/common/assets/assets.gen.dart';
import 'package:test_project/common/config/helper_style.dart';
import 'package:test_project/common/config/static_text.dart';
import 'package:test_project/common/reuseables/test_project_textfield.dart';
import 'package:test_project/logic/providers/authentication_provider.dart';
import 'package:test_project/theme/color_pallete.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({super.key, required this.auth});
  final AutheticationProvider auth;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            StaticText.phoneNumber,
            style: HelperStyle.textStyle(
              Pallete.labelColor,
              16.sp,
              FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 59.h,
                padding: EdgeInsets.only(
                  left: 7.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      7.sp,
                    ),
                    bottomLeft: Radius.circular(
                      7.sp,
                    ),
                  ),
                  border: const Border(
                    right: BorderSide(
                      color: Pallete.borderColor,
                    ),
                    top: BorderSide(
                      color: Pallete.borderColor,
                    ),
                    bottom: BorderSide(
                      color: Pallete.borderColor,
                    ),
                    left: BorderSide(
                      color: Pallete.borderColor,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      Assets.images.nigeriaFlag.path,
                      scale: 4.sp,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 30.sp,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 320.w,
                child: TestProjectTextField(
                  keyboardType: TextInputType.phone,
                  validator: (e) => auth.validateText(e),
                  labelText: "",
                  hintText: StaticText.phoneHint,
                  focusedBorderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                      7.sp,
                    ),
                    bottomRight: Radius.circular(
                      7.sp,
                    ),
                  ),
                  disabledBorderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                      7.sp,
                    ),
                    bottomRight: Radius.circular(
                      7.sp,
                    ),
                  ),
                  errorBorderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                      7.sp,
                    ),
                    bottomRight: Radius.circular(
                      7.sp,
                    ),
                  ),
                  enabledBorderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                      7.sp,
                    ),
                    bottomRight: Radius.circular(
                      7.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
