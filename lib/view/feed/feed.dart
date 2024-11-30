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
    );
  }
}