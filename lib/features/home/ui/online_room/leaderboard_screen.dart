import 'package:flutter/material.dart';
import 'package:moltaqa/core/theming/text_styles.dart';
import 'package:moltaqa/features/home/ui/widgets/online_room/leaderboard_player_card.dart';
import 'package:moltaqa/features/home/ui/widgets/online_room/leaderboard_widget.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LeaderboardWidget(),
              Stack(
                children: [
                  Container(color: Color(0xffD3AEFF), height: 50),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Current Rank",
                          style: TextStylesManager.titleLarge,
                        ),
                        const SizedBox(height: 15),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 50,
                          itemBuilder: (context, index) {
                            return LeaderboardPlayerCard(rank: index + 4);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
