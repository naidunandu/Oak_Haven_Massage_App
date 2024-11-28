import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/utils/app_assets.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18,color: CustomColors.primary),
        ),
        actions: [
          Row(
            children: [
              Image.asset(AppAssets.logout),
              const Text(
                "Log Out",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: CustomColors.error),
              ).paddingOnly(left: 8, right: 22),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.amber.shade400,
                  child: Image.asset(
                    AppAssets.profileImg,
                    height: 140,
                    fit: BoxFit.contain,
                  )),
            ).paddingOnly(bottom: 20),
            Center(
                child: const Text(
              "Emily Walker",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ).paddingOnly(bottom: 5)),
            Center(
                child: const Text(
              "+123 856479683",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: CustomColors.secondary,
              ),
            ).paddingOnly(bottom: 15)),
            const Text(
              "Areas of Specialty:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: CustomColors.primary,
              ),
            ).paddingOnly(bottom: 5),
            const Text(
              "Neck and Shoulders",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: CustomColors.secondary,
              ),
            ).paddingOnly(bottom: 3),
            const Text("Swedish",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.secondary,
                )).paddingOnly(bottom: 3),
            const Text(
              "Deep Tissue",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: CustomColors.secondary,
              ),
            ).paddingOnly(bottom: 20),
            const Text(
              "Bio:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: CustomColors.primary,
              ),
            ).paddingOnly(bottom: 5),
            const Text(
              "MY personal experience compelled her to look into the massage industry because she had seen the effects of massage firsthand. Today she is helping out a number of people through Swedish and deep tissue massage therapy.",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: CustomColors.secondary,
              ),
            ).paddingOnly(bottom: 3),
          ],
        ),
      ),
    );
  }
}
