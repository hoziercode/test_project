import 'package:flutter/material.dart';
import 'package:test_project/router/router_constant.dart';
import 'package:test_project/utils/utils.dart';

class AutheticationProvider extends ChangeNotifier {
  AutheticationProvider({required BuildContext ctx}) {
    context = ctx;
    debugPrint("authentication provider init $hashCode");
  }

  @override
  void dispose() {
    debugPrint("authentication provider dispose $hashCode");
    super.dispose();
  }

  PageController pageController = PageController();
  int currentPage = 0;
  bool isObsured = true;
  bool isObsured1 = true;

  BuildContext? context;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController pinputController = TextEditingController();

  void loginUser() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Utils.showSuccessFlushbar(context!, "Sign In Successful");
    }
  }

  void registerCustomer() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (passwordController.text == confirmPassword.text) {
        Navigator.of(context!).pushNamedAndRemoveUntil(
          RoutePaths.loginScreen,
          (route) => false,
        );
      } else {
        Utils.showErrorFlushbar(context!, "password don't match!");
      }
    }
  }

  void resetPassword() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (passwordController.text == confirmPassword.text) {
        Navigator.of(context!).pushNamedAndRemoveUntil(
          RoutePaths.successScreen,
          (route) => false,
        );
      } else {
        Utils.showErrorFlushbar(context!, "password don't match!");
      }
    }
  }

  void registerSeller() {
    if (formKey1.currentState!.validate()) {
      formKey1.currentState!.save();
      if (passwordController.text == confirmPassword.text) {
        Navigator.of(context!).pushNamedAndRemoveUntil(
          RoutePaths.loginScreen,
          (route) => false,
        );
      } else {
        Utils.showErrorFlushbar(context!, "password don't match!");
      }
    }
  }

  void submitEmail() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.pushNamed(
        context!,
        RoutePaths.verifyOtp,
      );
    }
  }

  void submitPin() {
    if (pinputController.text.length == 6) {
      Navigator.pushNamed(
        context!,
        RoutePaths.resetPassword,
      );
    } else {
      Utils.showErrorFlushbar(context!, "fill the field");
    }
  }

  void setCurrentIndex(int index) {
    currentPage = index;
    notifyListeners();
  }

  String? validateText(String? value) {
    if (value!.isEmpty) {
      return 'Required';
    }
    return null;
  }

  String? validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }
    if (!_isValidEmail(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter a password';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least 1 uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least 1 lowercase letter';
    }

    if (!RegExp(r'\d').hasMatch(value)) {
      return 'Password must contain at least 1 digit';
    }

    if (!RegExp(r'[\W_]').hasMatch(value)) {
      return 'Password must contain at least 1 special character or symbol';
    }

    return null;
  }

  bool _isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
    );
    return emailRegex.hasMatch(email);
  }

  void setIsObsured() {
    isObsured = !isObsured;
    notifyListeners();
  }

  void setIsObsured1() {
    isObsured1 = !isObsured1;
    notifyListeners();
  }
}
