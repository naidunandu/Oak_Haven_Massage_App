import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/controllers/otp_controller.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';
import 'package:oak_haven_massage_app/widgets/rounded_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});
  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
      init: OtpController(),
      builder: (ctrl) {
        return Scaffold(
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 2 / 100,
                left: 22,
                right: 22,
                bottom: 10,
              ),
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back),
                  ).paddingOnly(bottom: 21),
                ),
                const Text(
                  "Verify OTP",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.primary,
                  ),
                ).paddingOnly(bottom: 16),
                const Text(
                  "An OTP has been sent to your registered email address. Please enter it below.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                    color: CustomColors.secondary,
                  ),
                ).paddingOnly(bottom: 41),
                PinCodeTextField(
                  focusNode: ctrl.txtOtpFocus,
                  controller: ctrl.txtOtp,
                  appContext: context,
                  length: 5,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  cursorColor: CustomColors.primary,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(20),
                    fieldHeight: 60,
                    fieldWidth: 60,
                    inactiveColor: CustomColors.border,
                    inactiveFillColor: CustomColors.placeholder,
                    activeFillColor: CustomColors.placeholder,
                    activeColor: CustomColors.border,
                    selectedFillColor: CustomColors.placeholder,
                    selectedColor: CustomColors.border,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                ).paddingOnly(bottom: 30),
                RoundedButton(
                  text: "Verify",
                  isLoading: ctrl.isLoading,
                  loadingText: "loading....",
                  onTap: () => ctrl.verify(),
                ).paddingOnly(bottom: 26),
                RichText(
                  text: TextSpan(
                    text: "Didn't get OTP? ",
                    style:  const TextStyle(color: CustomColors.secondary, fontSize: 14),
                    children: [
                      TextSpan(
                        text: "Resend OTP",
                        style: const TextStyle(
                          color: CustomColors.link,
                          fontSize: 14,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle resend OTP logic here
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Resend OTP clicked!')),
                            );
                          },
                      ),
                    ],
                  ),
                ).paddingOnly(bottom: 41),
              ],
            ),
          ),
        );
      },
    );
  }
}
