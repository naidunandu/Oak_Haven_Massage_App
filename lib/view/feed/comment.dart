import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';
import 'package:oak_haven_massage_app/widgets/custom_textBox.dart';

import '../../routes/route_name.dart';
import '../../utils/app_assets.dart';
import '../../widgets/chat.dart';

class CommentView extends StatelessWidget {
  const CommentView({super.key});

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
              "Comments",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: CustomColors.primary,
              ),
            ),
          ],
        ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(AppAssets.heart).paddingOnly(right: 4),
                          const Text(
                            "512 K",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.1,
                            ),
                          )
                        ],
                      ).paddingOnly(right: 27),
                      Image.asset(AppAssets.like),
                    ],
                  ),
                  const Divider(
                    color: CustomColors.border,
                  ).paddingOnly(bottom: 5, top: 5),
                  /*Center(
                    child: Image.asset(AppAssets.comment),
                  ).paddingOnly(top: 21,bottom: 5),
                  const Center(
                    child: Text(
                      "No comments yet",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: CustomColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ).paddingOnly(bottom: 9),
                  const Center(
                    child: Text(
                      "Be the first to comment",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: CustomColors.secondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ),*/
                   SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: const MessagesScreen(),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: CustomColors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextBox(
                    borderRadius: BorderRadius.circular(30),
                    hintText: "Write a comment...",
                    keyboardType: TextInputType.text,
                  ).paddingOnly(bottom: 10),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed(RouteNames.payroll),
                        child: Image.asset(AppAssets.imgGrey),
                      ).paddingOnly(right: 16),
                      GestureDetector(
                        onTap: () => Get.toNamed(RouteNames.payroll),
                        child: Image.asset(AppAssets.gifGrey),
                      ).paddingOnly(right: 16),
                      GestureDetector(
                        onTap: () => Get.toNamed(RouteNames.payroll),
                        child: Image.asset(AppAssets.happyEmojiGrey),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Get.toNamed(RouteNames.payroll),
                        child: Image.asset(AppAssets.send),
                      ),
                    ],
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
