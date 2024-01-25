// ignore_for_file: avoid_single_cascade_in_expression_statements, use_build_context_synchronously
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin Utils {

  static DateTime? previous;

  static void psPrint(String msg) {
    final DateTime now = DateTime.now();
    int min = 0;
    if (previous == null) {
      previous = now;
    } else {
      min = now.difference(previous!).inMilliseconds;
      previous = now;
    }
    debugPrint('$now ($min)- $msg');
  }

  static showSuccessFlushbar(BuildContext context, String successMessage) {
    Flushbar(
      message: successMessage,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.green,
      icon: const Icon(
        Icons.check,
        color: Colors.white,
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          8.r,
        ),
        topRight: Radius.circular(
          8.r,
        ),
      ),
    )..show(context);
  }

  static showErrorFlushbar(BuildContext context, String errorMessage) {
    Flushbar(
      message: errorMessage,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          8.r,
        ),
        topRight: Radius.circular(
          8.r,
        ),
      ),
    )..show(context);
  }

  static String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }
}
