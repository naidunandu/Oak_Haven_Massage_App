import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/controllers/more/payroll_controller.dart';
import 'package:oak_haven_massage_app/utils/app_assets.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';
import 'package:oak_haven_massage_app/widgets/custom_textBox.dart';
import 'package:oak_haven_massage_app/widgets/rounded_button.dart';

class PayRollView extends StatelessWidget {
  const PayRollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: const Text(
          "Payroll & Benefits Questions",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: CustomColors.primary),
        ),
      ),
      body: GetBuilder<PayRollController>(
          init: PayRollController(),
          builder: (ctrl) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextBox(
                      fieldName: "Questions:",
                      hintText: "Write your question",
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter questions';
                        }
                        return null; // Input is valid
                      },
                    ).paddingOnly(bottom: 14),
                    const Text(
                      "Documents:",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.primary,
                      ),
                      textAlign: TextAlign.center, // Optional: Center text if needed
                    ).paddingOnly(bottom: 5),
                    DottedBorder(
                      dashPattern: const [10, 10],
                      radius: const Radius.circular(20),
                      color: Colors.grey,
                      child: Container(
                          color: CustomColors.background,
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          width: MediaQuery.of(context).size.width,
                          child: GestureDetector(
                            onTap: ctrl.pickFiles,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(AppAssets.uploadDocument).paddingOnly(bottom: 10, top: 19),
                                RichText(
                                  text: const TextSpan(
                                    text: "Click here ",
                                    style: TextStyle(color: CustomColors.link, fontSize: 14, fontWeight: FontWeight.w500),
                                    children: [
                                      TextSpan(
                                        text: " to upload document",
                                        style: TextStyle(color: CustomColors.secondary, fontSize: 14, fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ).paddingOnly(bottom: 19),
                              ],
                            ),
                          )),
                    ).paddingOnly(bottom: ctrl.files.isNotEmpty ? 10 : 41),
                    if (ctrl.files.isNotEmpty)
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: ctrl.files.length,
                        itemBuilder: (context, index) {
                          final file = ctrl.files[index];
                          return Card(
                            color: CustomColors.whiteLight,
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            child: ListTile(
                              leading: Image.asset(AppAssets.pdf),
                              title: Text(
                                file['name'],
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: CustomColors.primary,
                                ),
                              ).paddingOnly(bottom: 6),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (file['progress'] == 1.0)
                                    Text(
                                      '${(file['size'] / 1024).toStringAsFixed(2)} KB',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: CustomColors.secondary,
                                      ),
                                    ),
                                  if (file['progress'] != 1.0)
                                    LinearProgressIndicator(
                                      value: file['progress'],
                                      minHeight: 5.0,
                                      color: Colors.green,
                                    ).paddingOnly(bottom: 6),
                                  if (file['progress'] < 1.0)
                                    Text(
                                      '${(file['progress'] * 100).toStringAsFixed(0)}% Completed',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: CustomColors.secondary,
                                      ),
                                    ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon((file['progress'] != 1.0) ? Icons.close : Icons.delete),
                                onPressed: () => ctrl.removeFile(file['name']),
                              ),
                            ),
                          );
                        },
                      ).paddingOnly(bottom: 41),
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
          }),
    );
  }
}
