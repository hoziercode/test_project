// use this buton
///
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/common/config/helper_style.dart';

class TestProjectButton extends StatelessWidget {
  const TestProjectButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.title,
    required this.width,
    this.padding,
    this.borderRadius,
    required this.isRow,
    this.child,
    this.height,
    this.elevation,
  });
  final Function() onPressed;
  final Color backgroundColor;
  final Color textColor;
  final String? title;
  final double width;
  final double? height;
  final EdgeInsets? padding;
  final BorderRadiusGeometry? borderRadius;
  final bool isRow;
  final Widget? child;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      
      minWidth: width,
      height: height,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ??
            BorderRadius.circular(
              10.sp,
            ),
      ),
      onPressed: onPressed,
      color: backgroundColor,
      padding: padding,
      elevation: elevation ?? 0.5,
      child: isRow
          ? child
          : Text(
              title!,
              style: HelperStyle.textStyle(
                textColor,
                14.sp,
                FontWeight.w700,
              ),
            ),
    );
  }
}
