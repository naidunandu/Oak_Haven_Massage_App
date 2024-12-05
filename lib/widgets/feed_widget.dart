import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/models/feed.dart';

import '../utils/app_assets.dart';
import '../utils/app_theme.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({super.key, required this.feed});
  final Feed feed;

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                          Text(
                            widget.feed.user.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ).paddingOnly(right: 5),
                          const Icon(
                            Icons.circle,
                            color: CustomColors.secondary,
                            size: 5,
                          ).paddingOnly(right: 5),
                          Text(
                            widget.feed.time,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: CustomColors.secondary,
                            ),
                          ).paddingOnly(right: 80),
                        ],
                      ),
                      const Expanded(
                        child: Icon(Icons.more_horiz_rounded),
                      ),
                    ],
                  ),
                  Text(
                    widget.feed.user.occupation,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
        Text(
          widget.feed.description,
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.1),
        ).paddingOnly(bottom: 20),
        if (widget.feed.images.isNotEmpty)
          Row(
            children: [
              for (int i = 0; i < widget.feed.images.length; i++)
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            widget.feed.images[i], // Replace with actual image URL
                            fit: BoxFit.cover,
                            height: 200,
                          ),
                        ),
                      ),
                      if (i != widget.feed.images.length - 1) const SizedBox(width: 8)
                    ],
                  ),
                ),
            ],
          ).paddingOnly(bottom: 12),
        Row(
          children: [
            Row(
              children: [
                Image.asset(AppAssets.heart).paddingOnly(right: 4),
                Text(
                  widget.feed.like.toString(),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
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
                Text(
                  widget.feed.comment.toString(),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
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
    );
  }
}
