import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';
import 'package:oak_haven_massage_app/widgets/custom_textBox.dart';
import 'package:oak_haven_massage_app/widgets/rounded_button.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: const Text(
          "Feedback",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: CustomColors.primary),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextBox(
                fieldName: "Name:",
                // focusNode: ctrl.txtEmailFocus,
                // controller: ctrl.txtEmail,
                hintText: "Name",
                keyboardType: TextInputType.text,
                autofillHints: const [AutofillHints.name],
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null; // Input is valid
                },
              ).paddingOnly(bottom: 14),
              CustomTextBox(
                fieldName: "Suggestion:",
                // focusNode: ctrl.txtEmailFocus,
                // controller: ctrl.txtEmail,
                hintText: "Type the suggestion here...",
                maxLines: 10,
                keyboardType: TextInputType.text,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter your suggestion';
                  }
                  return null; // Input is valid
                },
              ).paddingOnly(bottom: 30),
              RoundedButton(
                borderRadius: 15.0,
                text: "Submit",
                isLoading: false,
                onTap: () => null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
