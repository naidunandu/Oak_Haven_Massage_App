import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';
import 'package:oak_haven_massage_app/widgets/custom_textBox.dart';
import 'package:oak_haven_massage_app/widgets/rounded_button.dart';

import '../../controllers/more/ptoRequest_controller.dart';
import '../../widgets/dashed_divider.dart';

class ScheduleChangeRequestView extends StatelessWidget {
  const ScheduleChangeRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: const Text(
          "Future Schedule Change Request",
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
                    fieldName: "Schedule Type:",
                    suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
                    hintText: "Select schedule type",
                    keyboardType: TextInputType.text,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter PTO hours';
                      }
                      return null; // Input is valid
                    },
                  ).paddingOnly(bottom: 14),
                  const Text(
                    "Select One time or Permanent:",
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
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            value: 'One Time',
                            groupValue: ctrl.selectedOption,
                            onChanged: ctrl.onChanged,
                          ),
                          const Text('One Time'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            activeColor: CustomColors.primary,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            value: 'Permanent',
                            groupValue: ctrl.selectedOption,
                            onChanged: ctrl.onChanged,
                          ),
                          const Text('Permanent'),
                        ],
                      ),
                    ],
                  ).paddingOnly(bottom: 10),
                  Row(
                    children: [
                      Expanded(
                          child: CustomTextBox(
                        onTap: () => ctrl.datePicker(),
                        readOnly: true,
                        controller: ctrl.txtDate,
                        fieldName: "Date:",
                        hintText: "MM/DD/YYYY",
                        keyboardType: TextInputType.text,
                        autofillHints: const [AutofillHints.name],
                        suffixIcon: const Icon(
                          Icons.calendar_today_rounded,
                          color: CustomColors.secondary,
                        ),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter Date';
                          }
                          return null; // Input is valid
                        },
                      )),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: CustomTextBox(
                          onTap: () => ctrl.datePicker(),
                          readOnly: true,
                          controller: ctrl.txtDate,
                          fieldName: "Time",
                          hintText: "Time",
                          keyboardType: TextInputType.text,
                          autofillHints: const [AutofillHints.name],
                          suffixIcon: const Icon(
                            Icons.calendar_today_rounded,
                            color: CustomColors.secondary,
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter Time';
                            }
                            return null; // Input is valid
                          },
                        ),
                      ),
                    ],
                  ).paddingOnly(bottom: 30),
                  Center(
                    child: SizedBox(
                      width: 168,
                      child: RoundedButton(
                        borderRadius: 10.0,
                        text: "Add",
                        isLoading: false,
                        onTap: () => null,
                      ),
                    ),
                  ).paddingOnly(bottom: 20),
                  CustomPaint(
                    size: const Size(double.infinity, 1), // Full-width dashed line
                    painter: DashedLinePainter(
                      color: CustomColors.border,
                      dashWidth: 13.0,
                      dashSpace: 10.0,
                      strokeWidth: 1.0,
                    ),
                  ).paddingOnly(bottom: 20),
                  const Text(
                    "Additional Notes:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: CustomColors.primary,
                    ),
                    textAlign: TextAlign.center, // Optional: Center text if needed
                  ).paddingOnly(bottom: 10),
                  CustomTextBox(
                    hintText: "Notes here..",
                    maxLines: 6,
                    keyboardType: TextInputType.text,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter your Notes';
                      }
                      return null; // Input is valid
                    },
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
          }),
    );
  }
}
