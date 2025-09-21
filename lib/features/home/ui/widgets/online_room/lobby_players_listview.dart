import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:moltaqa/core/routes/routes_constants.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';

class LobbyPlayersListview extends StatelessWidget {
  const LobbyPlayersListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        spacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Waiting for Players...",
                  style: TextStylesManager.titleMedium,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  decoration: BoxDecoration(
                    color: ColorsManager.borderColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("4", style: TextStylesManager.titleMedium),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => context.push(RoutesConstants.questionScreen),
            child: Text("questions screen"),
          ),
          ElevatedButton(
            onPressed: () => context.push(RoutesConstants.leaderboardScreen),
            child: Text("leaderboard screen"),
          ),
          ElevatedButton(
            onPressed:
                () => context.push(RoutesConstants.answerVerificationScreen),
            child: Text("answer Verification Screen"),
          ),

          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder:
                (context, index) => Container(
                  color:
                      index == 0
                          ? const Color(0xff8A784E).withValues(alpha: 0.7)
                          : null,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    spacing: 10,
                    children: [
                      CircleAvatar(radius: 25.r, child: Text("A")),
                      Text("Jack", style: TextStylesManager.titleMedium),
                    ],
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
