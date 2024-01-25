// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test_project/theme/color_pallete.dart';

class TestProjectPinput extends StatelessWidget {
  const TestProjectPinput({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      pastedTextStyle: TextStyle(
        color: Colors.green.shade600,
        fontWeight: FontWeight.bold,
      ),
      length: 6,
      obscureText: true,
      obscuringCharacter: '*',
      blinkWhenObscuring: true,
      hintCharacter: "-",
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 45.h,
        fieldWidth: 45.w,
        activeFillColor: Colors.white,
        inactiveColor: Pallete.borderColor,
        inactiveFillColor: Pallete.whiteColor,
        selectedFillColor: Pallete.whiteColor,
        activeColor: Pallete.secondaryColor,
      ),
      cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      controller: controller,
      keyboardType: TextInputType.number,
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 1),
          color: Colors.black12,
          blurRadius: 10,
        )
      ],
      onCompleted: (v) {
        debugPrint("Completed");
      },
      onTap: () {
        print("Pressed");
      },
      onChanged: (value) {
        debugPrint(value);
      },
      beforeTextPaste: (text) {
        debugPrint("Allowing to paste $text");
        return true;
      },
    );
  }
}
