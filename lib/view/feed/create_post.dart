import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';
import 'package:oak_haven_massage_app/widgets/custom_textBox.dart';
import 'package:oak_haven_massage_app/widgets/rounded_button.dart';

import '../../routes/route_name.dart';
import '../../utils/app_assets.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.close,
                color: CustomColors.secondary,
              ),
            ),
            const Text(
              "Create Post",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: CustomColors.primary,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(RouteNames.payroll),
            child: Image.asset(AppAssets.send),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.amber.shade400,
                        child: Image.asset(
                          AppAssets.profileImg,
                          height: 140,
                          fit: BoxFit.contain,
                        ),
                      ).paddingOnly(bottom: 20,right: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Emily Johnson",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ).paddingOnly(bottom: 5),
                          const Text(
                            "Massage Therapist",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: CustomColors.secondary,
                              letterSpacing: 0.1
                            ),
                          ).paddingOnly(bottom: 20),
                        ],
                      )
                    ],
                  ),
                  CustomTextBox(
                    borderRadius: BorderRadius.circular(14),
                    hintText: "What’s on your mind?",
                    maxLines: 15,
                    keyboardType: TextInputType.text,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'required';
                      }
                      return null; // Input is valid
                    },
                  ).paddingOnly(bottom: 30),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 18),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: CustomColors.placeholder,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(RouteNames.payroll),
                    child: Image.asset(AppAssets.img),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(RouteNames.payroll),
                    child: Image.asset(AppAssets.gif),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(RouteNames.payroll),
                    child: Image.asset(AppAssets.happyEmoji),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
