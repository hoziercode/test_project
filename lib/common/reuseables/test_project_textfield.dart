import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/common/config/helper_style.dart';
import 'package:test_project/theme/color_pallete.dart';

class TestProjectTextField extends StatelessWidget {
  const TestProjectTextField({
    super.key,
    this.filled,
    this.fillColor,
    this.hintText,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly,
    this.onChanged,
    this.controller,
    this.onTap,
    this.validator,
    this.enabledBorderRadius,
    this.errorBorderRadius,
    this.focusedBorderRadius,
    this.labelText,
    this.keyboardType,
    this.maxLine,
    this.prefixText,
    this.enabled,
    this.disabledBorderRadius,
    this.focusBorderColor,
    this.borderColor,
    this.obscureText,
  });
  final bool? filled;
  final bool? readOnly;
  final Color? fillColor;
  final String? hintText;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final BorderRadius? focusedBorderRadius;
  final BorderRadius? enabledBorderRadius;
  final BorderRadius? errorBorderRadius;
  final BorderRadius? disabledBorderRadius;
  final String? labelText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final int? maxLine;
  final String? prefixText;
  final bool? enabled;
  final Color? borderColor;
  final Color? focusBorderColor;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText == '')
          Container()
        else
          Padding(
            padding: EdgeInsets.only(
              bottom: 5.h,
            ),
            child: Text(
              labelText!,
              style: HelperStyle.textStyle(
                Pallete.labelColor,
                16.sp,
                FontWeight.w500,
              ),
            ),
          ),
        TextFormField(
          enabled: enabled ?? true,
          keyboardType: keyboardType,
          controller: controller,
          readOnly: readOnly ?? false,
          onChanged: onChanged,
          onTap: onTap,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLines: maxLine ?? 1,
          obscureText: obscureText ?? false,
          style: HelperStyle.textStyle(
            Pallete.blackColor,
            14.sp,
            FontWeight.w500,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 6.h,
              horizontal: 15.w,
            ),
            fillColor: fillColor ?? Pallete.whiteColor,
            filled: filled ?? true,
            hintText: hintText,
            hintStyle: HelperStyle.textStyle(
              Pallete.hintColor,
              14.sp,
              FontWeight.w400,
            ),
            prefix: prefix,
            suffix: suffix,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            prefixText: prefixText,
            prefixStyle: HelperStyle.textStyle(
              Pallete.blackColor,
              14.sp,
              FontWeight.w500,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: focusBorderColor ?? Pallete.skyBlue,
              ),
              borderRadius: focusedBorderRadius ??
                  BorderRadius.circular(
                    8.sp,
                  ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? Pallete.borderColor,
              ),
              borderRadius: enabledBorderRadius ??
                  BorderRadius.circular(
                    8.sp,
                  ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
              ),
              borderRadius: errorBorderRadius ??
                  BorderRadius.circular(
                    8.sp,
                  ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
              ),
              borderRadius: errorBorderRadius ??
                  BorderRadius.circular(
                    8.sp,
                  ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: disabledBorderRadius ??
                  BorderRadius.circular(
                    8.sp,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
