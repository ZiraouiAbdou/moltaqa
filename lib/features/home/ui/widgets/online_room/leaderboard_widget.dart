import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moltaqa/core/theming/text_styles.dart';

class LeaderboardWidget extends StatelessWidget {
  const LeaderboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/leaderboard_image.png",
          width: double.infinity,
          alignment: Alignment.topCenter,
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 125,
          child: Column(
            spacing: 10,
            children: [
              CircleAvatar(radius: 35.r),
              Text("Jack blaek", style: TextStylesManager.titleSmall),
            ],
          ),
        ),
        Positioned(
          left: 40,
          bottom: 90,
          child: Column(
            spacing: 10,
            children: [
              CircleAvatar(radius: 35.r),
              Text("Joe mari", style: TextStylesManager.titleSmall),
            ],
          ),
        ),
        Positioned(
          right: 40,
          bottom: 60,
          child: Column(
            spacing: 10,
            children: [
              CircleAvatar(radius: 35.r),
              Text("Philip", style: TextStylesManager.titleSmall),
            ],
          ),
        ),
      ],
    );
  }
}
