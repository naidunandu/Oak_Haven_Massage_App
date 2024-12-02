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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
          child: Column(
            children: [
              Column(
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
                                    "Stephen Smith",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Image.asset(AppAssets.heart).paddingOnly(right: 4),
                              const Text(
                                "156",
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
                          Row(
                            children: [
                              Image.asset(AppAssets.messageSquareText).paddingOnly(right: 4),
                              const Text(
                                "200",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.1,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => Get.toNamed(RouteNames.comment),
                        child: Image.asset(AppAssets.messageEdit),
                      ),
                    ],
                  )
                ],
              ),
              const Divider(
                color: CustomColors.border,
              ).paddingOnly(bottom: 5, top: 5),
              Column(
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distributes elements
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "Alexander Cumins",
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
                                      "20 mins",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: CustomColors.secondary,
                                      ),
                                    ).paddingOnly(right: 80),
                                  ],
                                ),
                                const Expanded(child: Icon(Icons.more_horiz_rounded)),
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
                        ),
                      )
                    ],
                  ),
                  const Text(
                    "💻 Need some desk setup inspo?\n\n👀 Check out my cozy study corner! Loving the minimalist vibes and natural lighting.",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.1),
                  ).paddingOnly(bottom: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            AppAssets.img2, // Replace with actual image URL
                            fit: BoxFit.cover,
                            height: 200,
                            width: 200,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            AppAssets.img1, // Replace with actual image URL
                            fit: BoxFit.cover,
                            height: 200,
                            width: 200,
                          ),
                        ),
                      ),
                    ],
                  ).paddingOnly(bottom: 12),
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset(AppAssets.heart).paddingOnly(right: 4),
                          const Text(
                            "512",
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
                      Row(
                        children: [
                          Image.asset(AppAssets.messageSquareText).paddingOnly(right: 4),
                          const Text(
                            "200",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.1,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Image.asset(AppAssets.messageEdit),
                    ],
                  )
                ],
              ),
              const Divider(
                color: CustomColors.border,
              ).paddingOnly(bottom: 5, top: 5),
              Column(
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distributes elements
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                      "20 mins",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: CustomColors.secondary,
                                      ),
                                    ).paddingOnly(right: 80),
                                  ],
                                ),
                                const Expanded(child: Icon(Icons.more_horiz_rounded)),
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
                        ),
                      )
                    ],
                  ),
                  const Text(
                    "📝 Just wrapped up my final project presentation! 🎓💼 Feeling a mix of relief and excitement for what's next. \nCheers to the end of another semester! \n🥂#StudentLife #FinalsDone #NextChapter",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.1),
                  ).paddingOnly(bottom: 20),
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset(AppAssets.heart).paddingOnly(right: 4),
                          const Text(
                            "512",
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
                      Row(
                        children: [
                          Image.asset(AppAssets.messageSquareText).paddingOnly(right: 4),
                          const Text(
                            "200",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.1,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Image.asset(AppAssets.messageEdit),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
