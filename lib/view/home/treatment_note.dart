import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/utils/app_assets.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';
import 'package:oak_haven_massage_app/widgets/custom_textBox.dart';
import 'package:oak_haven_massage_app/widgets/rounded_button.dart';

import '../../controllers/home/treatment_note_controller.dart';

class TreatmentNoteView extends StatelessWidget {
  const TreatmentNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: const Text(
          "Treatment Note",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: CustomColors.primary),
        ),
      ),
      body: GetBuilder<TreatmentNoteController>(
        init: TreatmentNoteController(),
        builder: (ctrl) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "John Branch",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: CustomColors.primary,
                            ),
                          ).paddingOnly(bottom: 3),
                          const Divider(
                            color: CustomColors.border,
                          ).paddingOnly(bottom: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.email_outlined,
                                color: CustomColors.primary,
                                size: 14,
                              ).paddingOnly(right: 6),
                              const Text(
                                "john.branch89@gmail.com",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: CustomColors.secondary,
                                ),
                              ),
                            ],
                          ).paddingOnly(bottom: 4),
                          Row(
                            children: [
                              const Text(
                                "01/25/1995",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: CustomColors.secondary,
                                ),
                              ).paddingOnly(right: 8),
                              const SizedBox(
                                height: 14, // Set height for the divider
                                child: VerticalDivider(
                                  color: CustomColors.border,
                                  thickness: 1,
                                ),
                              ).paddingOnly(right: 8),
                              const Text(
                                "29 y/o, Male",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: CustomColors.secondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ).paddingOnly(bottom: 10),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Type of Massage:",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: CustomColors.primary,
                            ),
                            textAlign: TextAlign.center, // Optional: Center text if needed
                          ).paddingOnly(bottom: 10),
                          Wrap(
                            spacing: 8.0, // Space between items horizontally
                            runSpacing: 8.0, // Space between rows vertically
                            children: ctrl.massage.keys.map((String key) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width / 2.6, // Half the screen width minus padding
                                child: Row(
                                  children: [
                                    Radio<String>(
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      value: key, // Each radio button's value
                                      groupValue: ctrl.selectedValue, // Current selected value
                                      activeColor: CustomColors.primary, // Active color for the radio button
                                      onChanged: (String? value) {
                                        ctrl.onSelected(value); // Update the selected value
                                      },
                                    ),
                                    Flexible(
                                      child: Text(
                                        key,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: CustomColors.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(), // Convert the map keys to a list of widgets
                          ),
                          CustomTextBox(
                            hintText: "Other",
                            keyboardType: TextInputType.text,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Please enter your Other';
                              }
                              return null; // Input is valid
                            },
                          ),
                        ],
                      ),
                    ),
                  ).paddingOnly(bottom: 10),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Area of Focus:",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: CustomColors.primary,
                            ),
                            textAlign: TextAlign.center, // Optional: Center text if needed
                          ).paddingOnly(bottom: 10),
                          Column(
                            children: List.generate(
                              (ctrl.areasOfFocus.length / 2).ceil(), // Calculate the number of rows
                              (rowIndex) {
                                // Get two items per row
                                final area1 = ctrl.areasOfFocus[rowIndex * 2];
                                final area2 = rowIndex * 2 + 1 < ctrl.areasOfFocus.length ? ctrl.areasOfFocus[rowIndex * 2 + 1] : null;

                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: _buildAreaWidget(area1, ctrl),
                                        ),
                                        if (area2 != null) // Add second item if it exists
                                          Expanded(
                                            child: _buildAreaWidget(area2, ctrl),
                                          ),
                                      ],
                                    ),
                                    if (rowIndex < (ctrl.areasOfFocus.length / 2).ceil() - 1) // Add divider except after the last row
                                      Divider(
                                        color: Colors.grey[200], // Divider color
                                        thickness: 1, // Divider thickness
                                        height: 1, // Space around the divider
                                      ),
                                  ],
                                );
                              },
                            ),
                          ),
                          CustomTextBox(
                            hintText: "Other",
                            keyboardType: TextInputType.text,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Please enter your Other';
                              }
                              return null; // Input is valid
                            },
                          ),
                        ],
                      ),
                    ),
                  ).paddingOnly(bottom: 10),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Pressure:",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: CustomColors.primary,
                            ),
                            textAlign: TextAlign.center, // Optional: Center text if needed
                          ).paddingOnly(bottom: 10),
                          Wrap(
                            spacing: 8.0, // Space between items horizontally
                            runSpacing: 8.0, // Space between rows vertically
                            children: ctrl.massage.keys.map((String key) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width / 2.6, // Half the screen width minus padding
                                child: Row(
                                  children: [
                                    Radio<String>(
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      value: key, // Each radio button's value
                                      groupValue: ctrl.selectedValue, // Current selected value
                                      activeColor: CustomColors.primary, // Active color for the radio button
                                      onChanged: (String? value) {
                                        ctrl.onSelected(value); // Update the selected value
                                      },
                                    ),
                                    Flexible(
                                      child: Text(
                                        key,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: CustomColors.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(), // Convert the map keys to a list of widgets
                          ),
                        ],
                      ),
                    ),
                  ).paddingOnly(bottom: 10),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Use circles to highlight specific body parts or areas of focus.",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: CustomColors.primary,
                            ),
                            textAlign: TextAlign.start, // Optional: Center text if needed
                          ).paddingOnly(bottom: 10),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Theme(
                                    data: Theme.of(context).copyWith(
                                      unselectedWidgetColor: Colors.green, // Custom border color for unselected radio buttons
                                    ),
                                    child: const Radio<String>(
                                      activeColor: CustomColors.primary,
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      value: 'Areas of Focus',
                                      groupValue: "",
                                      onChanged: null,
                                    ),
                                  ),
                                  const Text('Areas of Focus'),
                                ],
                              ),
                              Row(
                                children: [
                                  Theme(
                                    data: Theme.of(context).copyWith(
                                      unselectedWidgetColor: Colors.red, // Custom border color for unselected radio buttons
                                    ),
                                    child: const Radio<String>(
                                      focusColor: Colors.green,
                                      activeColor: CustomColors.primary,
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      value: 'Areas to Avoid',
                                      groupValue: "",
                                      onChanged: null,
                                    ),
                                  ),
                                  const Text('Areas to Avoid'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ).paddingOnly(bottom: 10),
                  Image.asset(AppAssets.bodyImg).paddingOnly(bottom: 10),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Treatment Recommendations:",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: CustomColors.primary,
                            ),
                            textAlign: TextAlign.center, // Optional: Center text if needed
                          ).paddingOnly(bottom: 10),
                          Wrap(
                            spacing: 8.0, // Space between items horizontally
                            runSpacing: 8.0, // Space between rows vertically
                            children: ctrl.treatmentRecommendations.keys.map((String key) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width / 2.6, // Half the screen width minus padding
                                child: Row(
                                  children: [
                                    Radio<String>(
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      value: key, // Each radio button's value
                                      groupValue: ctrl.selectedValue, // Current selected value
                                      activeColor: CustomColors.primary, // Active color for the radio button
                                      onChanged: (String? value) {
                                        ctrl.onSelected(value); // Update the selected value
                                      },
                                    ),
                                    Flexible(
                                      child: Text(
                                        key,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: CustomColors.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(), // Convert the map keys to a list of widgets
                          ),
                        ],
                      ),
                    ),
                  ).paddingOnly(bottom: 10),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Length of Session Recommended:",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: CustomColors.primary,
                            ),
                            textAlign: TextAlign.center, // Optional: Center text if needed
                          ).paddingOnly(bottom: 10),
                          Wrap(
                            spacing: 8.0, // Space between items horizontally
                            runSpacing: 8.0, // Space between rows vertically
                            children: ctrl.sessionRecommended.keys.map((String key) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width / 2.6, // Half the screen width minus padding
                                child: Row(
                                  children: [
                                    Radio<String>(
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      value: key, // Each radio button's value
                                      groupValue: ctrl.selectedValue, // Current selected value
                                      activeColor: CustomColors.primary, // Active color for the radio button
                                      onChanged: (String? value) {
                                        ctrl.onSelected(value); // Update the selected value
                                      },
                                    ),
                                    Flexible(
                                      child: Text(
                                        key,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: CustomColors.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(), // Convert the map keys to a list of widgets
                          ),
                        ],
                      ),
                    ),
                  ).paddingOnly(bottom: 10),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          ),
                        ],
                      ),
                    ),
                  ).paddingOnly(bottom: 14),
                  RoundedButton(
                    borderRadius: 15.0,
                    text: "Submit",
                    isLoading: false,
                    onTap: () => showCustomBottomSheet(context),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAreaWidget(Map<String, dynamic> area, dynamic ctrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (area['hasCheckbox'])
                Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: CustomColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  value: ctrl.selectedCheckboxes[area['title']] ?? false,
                  onChanged: (bool? value) {
                    ctrl.selectedCheckboxes[area['title']] = value ?? false;
                    ctrl.update();
                  },
                ),
              Text(
                area['title'],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: CustomColors.primary,
                ),
              ),
            ],
          ),
          if (area['hasRadios'] == true)
            Wrap(
              spacing: 8.0,
              children: (area['radioOptions'] as List<String>).map((option) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio<String>(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      activeColor: CustomColors.primary,
                      value: option,
                      groupValue: ctrl.selectedRadios[area['title']],
                      onChanged: (value) {
                        ctrl.selectedRadios[area['title']] = value;
                        ctrl.update();
                      },
                    ),
                    Text(
                      option,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.primary,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ensures the sheet wraps its content
            children: [
              // Top Divider
              Container(
                width: 50,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ).paddingOnly(bottom: 39),
              // Message
              const Text(
                "Are you sure you want to submit this treatment note?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),
              // Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context); // Close the bottom sheet
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        // Perform confirmation action
                        Navigator.pop(context); // Close the bottom sheet
                      },
                      child: const Text(
                        "Yes, Confirm",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ).paddingOnly(bottom: 39),
            ],
          ),
        );
      },
    );
  }

}
