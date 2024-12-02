import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';
import 'package:oak_haven_massage_app/widgets/custom_textBox.dart';
import 'package:oak_haven_massage_app/widgets/rounded_button.dart';

import '../../controllers/more/ptoRequest_controller.dart';

class PTORequestView extends StatelessWidget {
  const PTORequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: const Text(
          "PTO Request",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: CustomColors.primary),
        ),
      ),
      body: GetBuilder<PTORequestController>(
          init: PTORequestController(),
          builder: (ctrl) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextBox(
                  onTap: () => ctrl.datePicker(),
                  readOnly: true,
                  controller: ctrl.txtDate,
                  fieldName: "Date Requested:",
                  hintText: "Date",
                  keyboardType: TextInputType.text,
                  autofillHints: const [AutofillHints.name],
                  suffixIcon: const Icon(Icons.calendar_today_rounded,color: CustomColors.secondary,),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter Date';
                    }
                    return null; // Input is valid
                  },
                ).paddingOnly(bottom: 14),
                CustomTextBox(
                  fieldName: "Number of PTO Hours:",
                  hintText: "0",
                  keyboardType: TextInputType.text,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter PTO hours';
                    }
                    return null; // Input is valid
                  },
                ).paddingOnly(bottom: 14),
                const Text(
                  "Do you need your schedule blocked?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.primary,
                  ),
                  textAlign: TextAlign.center, // Optional: Center text if needed
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio<String>(
                          activeColor: CustomColors.primary,
                          materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
                          value: 'Yes',
                          groupValue: ctrl.selectedOption,
                          onChanged: ctrl.onChanged,
                        ),
                        const Text('Yes'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          activeColor: CustomColors.primary,
                          materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
                          value: 'No',
                          groupValue: ctrl.selectedOption,
                          onChanged: ctrl.onChanged,
                        ),
                        const Text('No'),
                      ],
                    ),
                  ],
                ).paddingOnly(bottom: 30),
                RoundedButton(
                  borderRadius: 10.0,
                  text: "Submit",
                  isLoading: false,
                  onTap: () => null,
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
