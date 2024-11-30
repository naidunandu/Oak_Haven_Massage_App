import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';
import 'package:oak_haven_massage_app/widgets/custom_textBox.dart';
import 'package:oak_haven_massage_app/widgets/rounded_button.dart';

import '../../controllers/loan_controller.dart';

class LoanView extends StatelessWidget {
  const LoanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: const Text(
          "Loan/Payroll Advance Request",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: CustomColors.primary),
        ),
      ),
      body: GetBuilder<LoanController>(
          init: LoanController(),
          builder: (ctrl) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextBox(
                      controller: ctrl.txtDate,
                      fieldName: "Loan Details:",
                      hintText: "Loan Details",
                      keyboardType: TextInputType.text,
                      maxLines: 3,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter loan details';
                        }
                        return null; // Input is valid
                      },
                    ).paddingOnly(bottom: 14),
                    CustomTextBox(
                      fieldName: "Amount Requested:",
                      hintText: "0",
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter amount requested';
                        }
                        return null; // Input is valid
                      },
                    ).paddingOnly(bottom: 14),
                    const Text(
                      "Repayment Schedule:",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.primary,
                      ),
                      textAlign: TextAlign.center, // Optional: Center text if needed
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio<String>(
                              activeColor: CustomColors.primary,
                              materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
                              value: 'Next paycheck',
                              groupValue: ctrl.repaymentSchedule,
                              onChanged: ctrl.onChangedRepaymentSchedule,
                            ),
                            const Text('Next paycheck'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              activeColor: CustomColors.primary,
                              materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
                              value: 'Split between next two paychecks',
                              groupValue: ctrl.repaymentSchedule,
                              onChanged: ctrl.onChangedRepaymentSchedule,
                            ),
                            const Text('Split between next two paychecks'),
                          ],
                        ),
                      ],
                    ).paddingOnly(bottom: 14),
                    CustomTextBox(
                      fieldName: "Disbursement of Funds:",
                      hintText: "Disbursement of Funds",
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter amount requested';
                        }
                        return null; // Input is valid
                      },
                    ).paddingOnly(bottom: 14),
                    CustomTextBox(
                      fieldName: "Primary Bank Account:",
                      hintText: "1234 1234 1234 1234",
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter amount requested';
                        }
                        return null; // Input is valid
                      },
                    ).paddingOnly(bottom: 14),
                    const Text(
                      "Payment Type:",
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
                              value: 'Venmo',
                              groupValue: ctrl.paymentType,
                              onChanged: ctrl.onChangedPaymentType,
                            ),
                            const Text('Venmo'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              activeColor: CustomColors.primary,
                              materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
                              value: 'Check',
                              groupValue: ctrl.paymentType,
                              onChanged: ctrl.onChangedPaymentType,
                            ),
                            const Text('Check'),
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
              ),
            );
          }
      ),
    );
  }
}
