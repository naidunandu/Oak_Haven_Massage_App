import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/utils/app_assets.dart';

import '../../routes/route_name.dart';
import '../../utils/app_theme.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        title: const Text(
          "Communication Feed",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: CustomColors.primary),
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(RouteNames.createPost),
            child: Image.asset(AppAssets.circleAdd),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.amber.shade400,
                  child: Image.asset(
                    AppAssets.profileImg,
                    height: 140,
                    fit: BoxFit.contain,
                  ),
                ).paddingOnly(bottom: 12, right: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distributes elements
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Emily Johnson",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ).paddingOnly(right: 5),
                            const Icon(
                              Icons.circle,
                              color: CustomColors.secondary,
                              size: 5,
                            ).paddingOnly(right: 5),
                            const Text(
                              "10 mins",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: CustomColors.secondary,
                              ),
                            ).paddingOnly(right: 80),
                          ],
                        ),
                        const Icon(Icons.more_horiz_rounded),
                      ],
                    ),
                    const Text(
                      "Massage Therapist",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.secondary,
                        letterSpacing: 0.1,
                      ),
                    ).paddingOnly(bottom: 12),
                  ],
                )
              ],
            ),
            const Text(
              "📚 Just conquered algorithms & data structures! 🎉 Time for a breather. Suggestions for a binge-worthy show? 🍿\n#StudyBreak #NetflixTime",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.1),
            ).paddingOnly(bottom: 20),
          ],
        ),
      ),
    );
  }
}
