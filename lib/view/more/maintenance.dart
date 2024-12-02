import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/controllers/more/maintenance_controller.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';
import 'package:oak_haven_massage_app/widgets/custom_textBox.dart';
import 'package:oak_haven_massage_app/widgets/rounded_button.dart';

class MaintenanceView extends StatelessWidget {
  const MaintenanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: const Text(
          "Maintenance/Equipment Request",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: CustomColors.primary),
        ),
      ),
      body: GetBuilder<MaintenanceController>(
          init: MaintenanceController(),
          builder: (ctrl) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextBox(
                      fieldName: "Room #:",
                      hintText: "Room",
                      keyboardType: TextInputType.text,
                      autofillHints: const [AutofillHints.name],
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter your room';
                        }
                        return null; // Input is valid
                      },
                    ).paddingOnly(bottom: 14),
                    CustomTextBox(
                      fieldName: "Maintenance Issue:",
                      hintText: "Please describe..",
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter your maintenance issue';
                        }
                        return null; // Input is valid
                      },
                    ).paddingOnly(bottom: 14),
                    const Text(
                      "Equipment Request:",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.primary,
                      ),
                      textAlign: TextAlign.center, // Optional: Center text if needed
                    ),
                    ...ctrl.selection.keys.map((String key) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,// Align the content to the start
                        children: [
                          Checkbox(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder( // Set the shape of the checkbox
                              borderRadius: BorderRadius.circular(5), // You can adjust the radius for rounded corners
                            ),
                            activeColor: CustomColors.primary,
                            value: ctrl.selection[key],
                            onChanged: (bool? value) {
                              ctrl.onChanged(value, key);
                            },
                          ),
                          // Center the text beside the checkbox
                          Text(
                            key,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: CustomColors.primary,
                            ),
                            textAlign: TextAlign.center, // Optional: Center text if needed
                          ),
                        ],
                      );
                    }),
                    CustomTextBox(
                      hintText: "Curtain",
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter your Curtain';
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
              ),
            );
          }
      ),
    );
  }
}
