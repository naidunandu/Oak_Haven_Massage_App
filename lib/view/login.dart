import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/controllers/login_controller.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';
import 'package:oak_haven_massage_app/widgets/custom_textBox.dart';
import 'package:oak_haven_massage_app/widgets/rounded_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (ctrl) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            body: SafeArea(
              child: ListView(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 10 / 100,
                  left: 23,
                  right: 23,
                  bottom: 10,
                ),
                children: [
                  const Text(
                    "Welcome Back!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: CustomColors.primary,
                    ),
                  ).paddingOnly(bottom: 16),
                  const Text(
                    "Enter your registered email, and we will send you an OTP to verify your login.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                      color: CustomColors.secondary,
                    ),
                  ).paddingOnly(bottom: 46),
                  CustomTextBox(
                    focusNode: ctrl.txtEmailFocus,
                    controller: ctrl.txtEmail,
                    hintText: "Enter your email",
                    keyboardType: TextInputType.text,
                    autofillHints: const [AutofillHints.email],
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(val)) {
                        return 'Please enter a valid email';
                      }
                      return null; // Input is valid
                    },
                  ).paddingOnly(bottom: 30),
                  RoundedButton(
                    borderRadius: 14.0,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    text: "Send OTP",
                    isLoading: ctrl.isLoading,
                    onTap: () => ctrl.signIn(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
